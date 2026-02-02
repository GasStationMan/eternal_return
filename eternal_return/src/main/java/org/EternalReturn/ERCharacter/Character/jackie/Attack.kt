package org.EternalReturn.ERCharacter.Character.jackie

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterAttackEvent
import org.EternalReturn.Util.dpengine.behaviour.MonobehaviourEvent
import org.bukkit.entity.Entity

class Attack : ERCharacterMonobehaviour<CharacterAttackEvent>() {

    public override fun start(event: CharacterAttackEvent) {
        val player = getPlayer()

        val dir = this.getERCharacter().direction;

        event.victim.setVelocity(dir * 10.0);

        if((actor as Character_Jackie).isBloodSweep){
            //victim deal more
            //heal myself
        }

    }

    public override fun update(eventList: MutableCollection<MonobehaviourEvent>) {
        stopMonobehav();
    }
}