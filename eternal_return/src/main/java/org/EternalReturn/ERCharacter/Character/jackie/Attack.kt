package org.EternalReturn.ERCharacter.Character.jackie

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterAttackEvent
import org.EternalReturn.util.dpengine.behaviour.MonobehaviourEvent

class Attack : ERCharacterMonobehaviour<CharacterAttackEvent>() {

    public override fun start(event: CharacterAttackEvent) {

        val dir = this.getERCharacter().direction;

        if((actor as Character_Jackie).isBloodSweep){

            event.victim.setVelocity(dir * 10.0);
            //victim deal more
            //heal myself
        }

    }

    public override fun update(eventList: MutableCollection<MonobehaviourEvent>) {
        stopMonobehav();
    }
}