package org.EternalReturn.Util.Monobehaviour;

import org.EternalReturn.System.DPEngine;
import org.EternalReturn.Util.physics.Geometry.Collider;
import org.EternalReturn.Util.physics.Geometry.MatVecCalculator;
import org.jetbrains.annotations.NotNull;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
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
    protected LinkedList<MonobehaviourEvent> submittedEvent;

    /**
     * update(MonobehaviourEvent)를 호출할 Monobehaviour들을 스케줄링하기 위해 유지하는 링크드 리스트
     * */
    protected LinkedList<Monobehaviour<? extends MonobehaviourEvent>> runningBehaviours;

    protected DPEngine engine;


    /**
     * 외부에서 해당 객체에게 이벤트를 제출하기 위한 창구
     * */
    public void submitEvent(MonobehaviourEvent event){
        //System.out.println("Event submitted " + event.getClass() + " | Length = " + submittedEvent.size());
        submittedEvent.add(event);

    }

    protected MonobehaviourActor(){
        this.submittedEvent = new LinkedList<>();
        this.monobehaviourMap = new HashMap<>();
        this.runningBehaviours = new LinkedList<>();
    }

    private MonobehaviourEvent consumeEvent(){

        if(submittedEvent.isEmpty()){
            return null;
        }

        return submittedEvent.removeFirst();
    }

    public void tick() {

        LinkedList<MonobehaviourEvent> tmpList = new LinkedList<>();

        MonobehaviourEvent event;
        while(!((event = consumeEvent()) == null)) {
            Monobehaviour<? extends MonobehaviourEvent> mb = monobehaviourMap.get(event.getClass());
            System.out.println(event.getClass());
            if (mb == null) {
                continue;
            }
            mb.dispatchEvent(event);
            tmpList.add(event);
        }

        //일단 무식하게 for - loop 돌리기
        //나중에 이 monobehaviour이 많아지면, linkedList로 관리할 것임.
        Iterator<Monobehaviour<? extends MonobehaviourEvent>> monobehavNode = runningBehaviours.iterator();
        while(monobehavNode.hasNext()){

        }
        for (Monobehaviour<? extends MonobehaviourEvent> monobehaviour : monobehaviourMap.values()) {
            if(monobehaviour.isRunning()){
                monobehaviour.updateMonobehav(submittedEvent);
            }
        }

        tmpList.clear();
    }

    /**
     * 해당 이벤트 클래스에 맞는 (MonobehaviourEvent, Monobehaviour) 쌍을 저장한다.
     * */
    protected void registerMonobehaviour(MonobehaviourActor actor, Monobehaviour<? extends MonobehaviourEvent> monobehaviour) {
        if(this.monobehaviourMap.get(monobehaviour.getEventType()) != null){
            throw new DuplicatedMonobehaviourRegisterException("Key " + monobehaviour.getEventType() + " is duplicated.");
        }
        this.monobehaviourMap.put(monobehaviour.getEventType(), monobehaviour);
        monobehaviour.setParentNode(actor);
        System.out.println("register event " + monobehaviour.getClass());
    }

    /**
     * 해당 MonobehaviourActor을 관리할 DPEngine을 설정.
     * */
    public void setDPEngine(@NotNull DPEngine engine) {
        this.engine = engine;
    }

}
