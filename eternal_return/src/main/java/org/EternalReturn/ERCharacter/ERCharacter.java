package org.EternalReturn.ERCharacter;

import jdk.jfr.EventType;
import org.EternalReturn.ERCharacter.Debuff.Stun;
import org.EternalReturn.ERCharacter.Event.CharacterEvent;
import org.EternalReturn.ERCharacter.util.DuplicatedMonobehaviourRegisterException;
import org.EternalReturn.ERCharacter.util.ERMonobehaviour;
import org.EternalReturn.ERCharacter.util.Monobehaviour;
import org.EternalReturn.ERCharacter.util.MonobehaviourActor;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.bukkit.entity.Entity;

import java.util.HashMap;
import java.util.LinkedList;

public abstract class ERCharacter extends MonobehaviourActor {

    protected ERPlayer erPlayer;

    protected long cooldownSeconds;

    protected LinkedList<CharacterEvent> submittedEvent;

    protected HashMap<Class<? extends CharacterEvent>,ERMonobehaviour<? extends CharacterEvent>> monobehaviourMap;

    public ERCharacter(ERPlayer erPlayer){
        this.erPlayer = erPlayer;
        this.submittedEvent = new LinkedList<>();
        this.monobehaviourMap = new HashMap<>();
        this.registerMonobehaviour(this, new Stun());
    }

    public void submitEvent(CharacterEvent event){
        submittedEvent.add(event);
        System.out.println("EventLength = " + submittedEvent.size());
    }

    public CharacterEvent consumeEvent(){
        if(submittedEvent.isEmpty()){
            return null;
        }
        return submittedEvent.removeFirst();
    }

    public abstract String getName();

    public void tick(){
        CharacterEvent event;
        while ((event = consumeEvent()) != null) {
            System.out.println("Event consumed");
            Monobehaviour<? extends CharacterEvent> mb = monobehaviourMap.get(event.getClass());
            if(mb == null){
                continue;
            }
            mb.dispatchEvent(event);
        }

        //일단 무식하게 for - loop 돌리기
        //나중에 이 monobehaviour이 많아지면, linkedList로 관리할 것임.
        for(Monobehaviour<? extends CharacterEvent> monobehaviour : monobehaviourMap.values()){
            monobehaviour.update();
        }

    }

    protected boolean isNotEnd(long startTime, long durationTicks){
        return System.currentTimeMillis() - startTime < durationTicks * 50;
    }

    public ERPlayer getERPlayer(){
        return this.erPlayer;
    }

    /**
     * 해당 이벤트 클래스에 맞는 Monobehaviour을 저장한다.
     * */
    protected void registerMonobehaviour(ERCharacter actor, ERMonobehaviour<? extends CharacterEvent> monobehaviour) {
        if(this.monobehaviourMap.get(monobehaviour.getEventType()) != null){
            throw new DuplicatedMonobehaviourRegisterException("Key " + monobehaviour.getEventType() + " is duplicated.");
        }
        this.monobehaviourMap.put(monobehaviour.getEventType(), monobehaviour);
        monobehaviour.setParentNode(actor);
    }
}
