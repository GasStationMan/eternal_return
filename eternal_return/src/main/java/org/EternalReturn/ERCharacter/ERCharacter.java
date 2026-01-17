package org.EternalReturn.ERCharacter;

import org.EternalReturn.ERCharacter.Event.CharacterAttackEvent;
import org.EternalReturn.ERCharacter.Event.CharacterEvent;
import org.EternalReturn.ERCharacter.Event.CharacterSwapHandEvent;
import org.EternalReturn.ERCharacter.util.Monobehaviour;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.bukkit.entity.Entity;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

public abstract class ERCharacter {

    protected ERPlayer erPlayer;

    protected long cooldownSeconds;

    protected LinkedList<CharacterEvent> submittedEvent;

    public ERCharacter(ERPlayer erPlayer){
        this.erPlayer = erPlayer;
        this.submittedEvent = new LinkedList<>();
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

    public abstract void update();

    public abstract void onAttack(ERPlayer attacker, Entity victim);

    public abstract void onActiveSkill(ERPlayer player);

    public void tick(){
        CharacterEvent e;
        while ((e = consumeEvent()) != null) {

            System.out.println("Event consumed");

            if (e instanceof CharacterAttackEvent attackEvent) {
                onAttack(attackEvent.attacker, attackEvent.victim);
            }
            else if (e instanceof CharacterSwapHandEvent swapHandEvent) {
                onActiveSkill(swapHandEvent.player);
            }
        }
    }

    protected boolean isNotEnd(long startTime, long durationTicks){
        return System.currentTimeMillis() - startTime < durationTicks * 50;
    }

}
