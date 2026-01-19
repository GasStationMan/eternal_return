package org.EternalReturn.ERAnimal.GlobalMonobehav;

import org.EternalReturn.ERAnimal.ERAJEntity;
import org.EternalReturn.ERAnimal.ERAnimalMonobehaviour;
import org.EternalReturn.ERAnimal.Event.ERAnimalAttackedByPlayerEvent;
import org.EternalReturn.ERAnimal.Event.ERAnimalPlayerToFarAwayEvent;
import org.EternalReturn.Util.Behaviour.MonobehaviourEvent;
import org.bukkit.Location;
import org.bukkit.entity.Entity;
import org.bukkit.entity.Husk;

import java.util.List;

public class Battle extends ERAnimalMonobehaviour<ERAnimalAttackedByPlayerEvent> {

    private ERAJEntity ajEntity;

    private AnimalState state;

    private enum AnimalState{
        ATTACK,
        MOVE
    }

    @Override
    public void start(ERAnimalAttackedByPlayerEvent event) {
        ajEntity = getERAJEntity();
        state = AnimalState.MOVE;
    }

    @Override
    public void update(List<MonobehaviourEvent> eventList) {

        for(MonobehaviourEvent event : eventList){
            if(event instanceof ERAnimalPlayerToFarAwayEvent){
                ajEntity.stopAnim();
                stopMonobehav();
            }
        }

        //rotating == look at a target
        Husk actor = (Husk)ajEntity.getActor();
        Entity target = actor.getTarget();
        if(target == null) return;

        Entity root = ajEntity.getRootEntity();
        Location actorLoc = actor.getLocation();
        root.setRotation(actorLoc.getYaw(), root.getLocation().getPitch());

        //범위 내에 있는가?
        boolean isInDistance = isInDistance(3, actor, target);

        if(isInDistance && state != AnimalState.ATTACK){
            state = AnimalState.ATTACK;
        }else if(!ajEntity.isPlaying("attack")){
            state = AnimalState.MOVE;
        }

        if(state == AnimalState.MOVE){
            actor.setAI(true);
            if(actor.getVelocity().isZero()){
                ajEntity.stopAnim();
                return;
            }
            ajEntity.playAnim("move");
        }

        if(state == AnimalState.ATTACK){
            actor.setAI(false);
            ajEntity.playAnimForce("attack");
        }
    }



}
