package org.EternalReturn.ERCharacter.Character.fiora

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterAttackEvent
import org.EternalReturn.ERCharacter.Character.fiora.event.ERToucheCountEvent
import org.EternalReturn.util.dpengine.behaviour.MonobehaviourEvent
import org.bukkit.Particle
import org.bukkit.entity.LivingEntity
import org.bukkit.entity.Player

class Passive : ERCharacterMonobehaviour<CharacterAttackEvent>() {
    private var punchTimeMillis: Long = 0

    override fun start(event: CharacterAttackEvent) {
        val victimEntity = event.victim.entity

        //punchTimeMillis = System.currentTimeMillis() + 10 * 50

        event.victim.submitEvent(ERToucheCountEvent(this.getEREntity().entity as Player))
    }

    override fun update(eventList: MutableCollection<MonobehaviourEvent>) {
        stopMonobehav();
    }


}