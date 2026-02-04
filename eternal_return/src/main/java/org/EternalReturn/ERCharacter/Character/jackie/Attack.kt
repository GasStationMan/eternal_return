package org.EternalReturn.ERCharacter.Character.jackie

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterAttackEvent
import org.EternalReturn.util.dpengine.behaviour.MonobehaviourEvent
import org.bukkit.Sound
import org.bukkit.entity.Entity
import javax.management.Attribute

class Attack : ERCharacterMonobehaviour<CharacterAttackEvent>() {

    public override fun start(event: CharacterAttackEvent) {
        val dir = this.getERCharacter().direction;
        val player = getPlayer()

        if((actor as Character_Jackie).isBloodSweep){
            val maxHealth = player.getAttribute(org.bukkit.attribute.Attribute.MAX_HEALTH)?.value ?: 20.0
            player.health = (player.health + 3.0).coerceAtMost(maxHealth)
            player.playSound(player.location, Sound.ENTITY_GENERIC_DRINK, 0.5f, 1.5f)
        }

    }

    public override fun update(eventList: MutableCollection<MonobehaviourEvent>) {
        stopMonobehav();
    }
}