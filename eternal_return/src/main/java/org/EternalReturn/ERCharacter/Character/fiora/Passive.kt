package org.EternalReturn.ERCharacter.Character.fiora

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterAttackEvent
import org.EternalReturn.EREntity.Event.ERToucheCountEvent
import org.EternalReturn.util.dpengine.behaviour.MonobehaviourEvent
import org.bukkit.Particle
import org.bukkit.entity.LivingEntity
import org.bukkit.entity.Player

class Passive : ERCharacterMonobehaviour<CharacterAttackEvent>() {
    private var punchTimeMillis: Long = 0

    override fun start(event: CharacterAttackEvent) {
        val victim = event.victim.entity as? LivingEntity ?: return
        val victimEntity = event.victim.entity

        if (victimEntity !is LivingEntity) {
            return
        }

        if (System.currentTimeMillis() < punchTimeMillis) {
            return
        }
        punchTimeMillis = System.currentTimeMillis() + 10 * 50
        event.victim.submitEvent(ERToucheCountEvent(this.entity as Player))
    }

    override fun update(eventList: MutableCollection<MonobehaviourEvent>) {
        val iterator = Touche.getStacks().entries.iterator()
        while (iterator.hasNext()) {
            val (victim, count) = iterator.next()

            if (!victim.isValid || victim.isDead || Touche.isExpired(victim)) {
                continue
            }

            drawParticles(victim, count)
        }
    }

    private fun drawParticles(victim: LivingEntity, count: Int) {
        val loc = victim.location
        val dist = 0.7
        val points = arrayOf(
            loc.clone().add(dist, 0.1, 0.0), loc.clone().add(-dist, 0.1, 0.0),
            loc.clone().add(0.0, 0.1, dist), loc.clone().add(0.0, 0.1, -dist)
        )
        for (i in 0 until count) {
            victim.world.spawnParticle(Particle.GLOW, points[i], 1, 0.0, 0.1, 0.0, 0.0)
        }
    }
}