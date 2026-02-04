package org.EternalReturn.EREntity.GlobalMonobehav

import org.EternalReturn.EREntity.EREntityMonobehaviour
import org.EternalReturn.EREntity.Event.EREntityDamagedEvent
import org.EternalReturn.util.dpengine.behaviour.MonobehaviourEvent
import org.bukkit.entity.LivingEntity

class InfinityHealing : EREntityMonobehaviour<EREntityDamagedEvent>() {
    public override fun start(event: EREntityDamagedEvent) {
        val entity = this.entity
        if (entity is LivingEntity) {
            entity.setHealth(20.0)
        }
    }

    public override fun update(eventList: MutableCollection<MonobehaviourEvent>) {
    }
}
