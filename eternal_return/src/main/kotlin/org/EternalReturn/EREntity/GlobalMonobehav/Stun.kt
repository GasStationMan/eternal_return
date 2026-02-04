package org.EternalReturn.EREntity.GlobalMonobehav

import org.EternalReturn.EREntity.EREntityMonobehaviour
import org.EternalReturn.EREntity.Event.EREntityStunEvent
import org.EternalReturn.util.dpengine.behaviour.MonobehaviourEvent
import org.bukkit.Location
import org.bukkit.Particle

class Stun : EREntityMonobehaviour<EREntityStunEvent>() {
    private var startStunMillies: Long = 0
    private var duration: Long = 0
    private var stunLocation: Location? = null

    public override fun start(event: EREntityStunEvent) {
        startStunMillies = event.startStunMillies
        duration = event.duration
        stunLocation = entity.location
        println("Stun event dispatched")
    }

    public override fun update(event: MutableCollection<MonobehaviourEvent>) {
        if (isNotEnd(startStunMillies, duration)) {
            entity.teleport(stunLocation!!)
            stunLocation!!.getWorld()!!.spawnParticle(
                Particle.ELECTRIC_SPARK,
                stunLocation!!.clone().add(0.0, 1.0, 0.0),
                3,
                0.3,
                0.3,
                0.3,
                0.05
            )
            return
        }
        stopMonobehav()
    }
}