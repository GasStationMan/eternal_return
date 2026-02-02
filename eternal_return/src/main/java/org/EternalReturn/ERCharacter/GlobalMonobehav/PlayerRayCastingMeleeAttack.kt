package org.EternalReturn.ERCharacter.GlobalMonobehav

import org.EternalReturn.ERAnimal.ERAnimal
import org.EternalReturn.ERAnimal.Event.ERAnimalAttackedByPlayerEvent
import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterAttackEvent
import org.EternalReturn.ERCharacter.Event.CharacterRayCastEvent
import org.EternalReturn.EREntity.EREntity
import org.EternalReturn.Util.dpengine.behaviour.MonobehaviourEvent
import org.EternalReturn.Util.dpengine.geometry.Vector3

class PlayerRayCastingMeleeAttack : ERCharacterMonobehaviour<CharacterRayCastEvent>() {

    override fun start(event: CharacterRayCastEvent) {

        var minDist = 16.0
        var closestTarget: EREntity? = null;
        val character = getERCharacter();

        getPlayer().sendMessage(this.javaClass.toString() + " is dispatched, list length is " + event.hitEntities.size)

        for(e in event.hitEntities){

            val ePos : Vector3 = e.getPosition();
            val pPos : Vector3 = this.getERCharacter().position;

            val distVec = ePos - pPos;

            val distanceSqr = magnitudeSqr(distVec);

            if(1.0 < distanceSqr && distanceSqr <= 16.0 && distanceSqr < minDist){
                minDist = distanceSqr;
                closestTarget = e;
                getERPlayer().sendMessage("Melee-attacked to -> " + e.javaClass)
            }
        }

        if(closestTarget == null){
            return;
        }

        if(closestTarget is ERAnimal){
            getERPlayer().sendMessage("Event send to " + closestTarget.javaClass)
            closestTarget.submitEvent(ERAnimalAttackedByPlayerEvent())
        }

        character.submitEvent(CharacterAttackEvent(character, closestTarget))
    }



    override fun update(eventList: MutableCollection<MonobehaviourEvent>) {
        stopMonobehav();
    }

}