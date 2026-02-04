package org.EternalReturn.ERAnimal.GlobalMonobehav;

import org.EternalReturn.ERAnimal.ERAJEntity;
import org.EternalReturn.ERAnimal.ERAnimalMonobehaviour;
import org.EternalReturn.ERAnimal.Event.ERAnimalAttackedByPlayerEvent;
import org.EternalReturn.util.dpengine.behaviour.MonobehaviourEvent;
import org.bukkit.Location;
import org.bukkit.entity.Entity;
import org.bukkit.entity.Husk;
import org.jetbrains.annotations.NotNull;

import java.util.Collection;

public class Battle extends ERAnimalMonobehaviour<ERAnimalAttackedByPlayerEvent> {

    private ERAJEntity ajEntity;

    private AnimalState state;

    private enum AnimalState{
        ATTACK,
        MOVE
    }

    @Override
    public void start(@NotNull ERAnimalAttackedByPlayerEvent event) {
        ajEntity = getERAJEntity();
        if(!ajEntity.isShown())return;
        state = AnimalState.MOVE;
        ((Husk)ajEntity.getActor()).setAI(true);
        System.out.println("attacked by player");
    }

    @Override
    public void update(Collection<MonobehaviourEvent> eventList) {

        //for(MonobehaviourEvent event : eventList){
        //    if(event instanceof ERAnimalPlayerToFarAwayEvent){
        //        ajEntity.stopAnim();
        //        stopMonobehav();
        //    }
        //}


        //System.out.println("updating");

        //rotating == look at a target
        Husk actor = (Husk)ajEntity.getActor();
        Entity target = actor.getTarget();
        if(target == null) return;

        Entity root = ajEntity.getRootEntity();
        Location actorLoc = actor.getLocation();
        root.setRotation(actorLoc.getYaw(), root.getLocation().getPitch());

        //범위 내에 있는가?
        boolean isInDistance = isInDistance(3, actor, target);

        //상태 결정
        if(isInDistance && state != AnimalState.ATTACK){
            state = AnimalState.ATTACK;
        }else if(!ajEntity.isPlaying("attack")){
            state = AnimalState.MOVE;
        }

        //상태에 따라 행동 : MOVE
        if(state == AnimalState.MOVE){
            actor.setAI(true);
            if(actor.getVelocity().isZero()){
                ajEntity.stopAnim();
                return;
            }
            ajEntity.playAnim("move");
        }

        //상태에 따라 행동 : ATTACK
        if(state == AnimalState.ATTACK){
            actor.setAI(false);
            ajEntity.playAnimForce("attack");
        }
    }

}
