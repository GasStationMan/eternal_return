package org.EternalReturn.ERCharacter.Character.jackie

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterAttackEvent
import org.EternalReturn.Util.DPEngine.behaviour.MonobehaviourEvent
import org.bukkit.entity.Entity

class Attack : ERCharacterMonobehaviour<CharacterAttackEvent>() {

    lateinit var victim : Entity;


    public override fun start(event: CharacterAttackEvent) {
        val player = getPlayer()
        victim = event.victim

        if((actor as Character_Jackie).isBloodSweep){
            //victim deal more
            //heal myself
        }

    }

    public override fun update(eventList: MutableCollection<MonobehaviourEvent>) {
        stopMonobehav();
    }
}