package org.EternalReturn.Util.DPEngine.Behaviour;

import org.EternalReturn.Util.DPEngine.DPEngine;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayDeque;
import java.util.HashMap;
import java.util.Iterator;

/**
 * Monobehaviour을 실행하기 위한 객체. <p>
 * (MonobehaviourEvent, Monobehaviour)의 키 쌍을 유지한다. <p>
 * 해당 객체로 이벤트가 전달되면, 전달된 이벤트들을 소비하여 정해진 Monobehaviour의 로직을 실행한다. <p>
 * 해당 객체로 이벤트를 전달하고자 한다면 <p>
 *     <code>MonobehaviourActor.submitEvent(MonobehaviourEvent)</code><p>
 *     메소드를 사용할 것. <p>
 * */
public abstract class MonobehaviourActor {
    
    /**
     * (MonobehaviourEvent, Monobehaviour)의 키 쌍
     * */
    protected HashMap<Class<? extends MonobehaviourEvent>, Monobehaviour<? extends MonobehaviourEvent>> monobehaviourMap;

    /**
     * 제출된 엔티티를 담는 큐 ( LinkedList )
     * */
    protected ArrayDeque<MonobehaviourEvent> submittedEvent;

    /**
     * update(MonobehaviourEvent)를 호출할 Monobehaviour들을 스케줄링하기 위해 유지하는 링크드 리스트
     * */
    protected ArrayDeque<Monobehaviour<? extends MonobehaviourEvent>> runningBehaviours;

    protected DPEngine engine;


    /**
     * 외부에서 해당 객체에게 이벤트를 제출하기 위한 창구
     * */
    public void submitEvent(MonobehaviourEvent event){
        //System.out.println("Event submitted " + event.getClass() + " | Length = " + submittedEvent.size());
        submittedEvent.add(event);
        engine.submitActorWhoTriggeredEvent(this);
    }

    protected MonobehaviourActor(){
        this.submittedEvent = new ArrayDeque<>();
        this.monobehaviourMap = new HashMap<>();
        this.runningBehaviours = new ArrayDeque<>();
        this.checkedEvent = new ArrayDeque<>();
    }

    private MonobehaviourEvent consumeEvent(){
        if(submittedEvent.isEmpty()){
            return null;
        }
        return submittedEvent.removeFirst();
    }

    /**
     * 제출된 이벤트 디큐에서 하나씩 빼면서 dispatch,
     * 해당 이벤트는 다시 checkedEvent 내에 삽입됨.
     * */
    protected ArrayDeque<MonobehaviourEvent> checkedEvent;
    public void dispatchEvents() {

        while(!submittedEvent.isEmpty()) {
            MonobehaviourEvent event = submittedEvent.removeFirst();
            Monobehaviour<? extends MonobehaviourEvent> monobehav = monobehaviourMap.get(event.getClass());
            //System.out.println(event.getClass());
            if (monobehav == null) {
                continue;
            }
            runningBehaviours.add(monobehav);
            //System.out.println("dispatch success");
            monobehav.dispatchEvent(event);
            checkedEvent.addLast(event);
        }
    }

    /**
     * 해당 Actor의 Monobehaviour을 update()함.
     * 만약 한개의 Monobehaviour도 Running이 아니라면 false를 반환
     * 그 외에는 true를 반환
     * */
    public boolean updateMonobehaviour(){
        if(runningBehaviours.isEmpty()){
            return false;
        }

        //monobehaviour update() 스케줄링
        Iterator<Monobehaviour<? extends MonobehaviourEvent>> monobehavNode = runningBehaviours.iterator();
        while(monobehavNode.hasNext()){

            Monobehaviour<?> monobehaviour = monobehavNode.next();
            monobehaviour.updateMonobehav(checkedEvent);
            //System.out.println("run");

            if(!monobehaviour.isRunning()){
                monobehavNode.remove();
                //System.out.println("removed : " + monobehaviour.getClass());
            }
        }
        checkedEvent.clear();
        return true;
    }

    public boolean isEmptyForRunningMonobehaviour(){
        return runningBehaviours.isEmpty();
    }

    /**
     * 해당 이벤트 클래스에 맞는 (MonobehaviourEvent, Monobehaviour) 쌍을 저장한다.
     * 또한 해당 Monobehaviour의 DPEngine객체 또한 저장한다.
     * */
    protected void registerMonobehaviour(MonobehaviourActor actor, Monobehaviour<? extends MonobehaviourEvent> monobehaviour) {
        if(this.monobehaviourMap.get(monobehaviour.getEventType()) != null){
            throw new DuplicatedMonobehaviourRegisterException("Key " + monobehaviour.getEventType() + " is duplicated.");
        }
        this.monobehaviourMap.put(monobehaviour.getEventType(), monobehaviour);
        monobehaviour.setMonobehaviourActor(actor);
        //System.out.println("register event " + monobehaviour.getClass());
    }

    /**
     * 해당 MonobehaviourActor을 관리할 DPEngine을 설정.
     * */
    public void setDPEngine(@NotNull DPEngine engine) {
        this.engine = engine;
        //System.out.println("DPEngine set");
    }

}
