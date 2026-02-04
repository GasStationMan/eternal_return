package org.EternalReturn.EREntity

import org.EternalReturn.EREntity.Event.EREntityEvent
import org.EternalReturn.System.EREngine
import org.EternalReturn.util.dpengine.behaviour.Monobehaviour
import org.bukkit.entity.Entity

abstract class EREntityMonobehaviour<T : EREntityEvent>() : Monobehaviour<T>() {

    fun getEREntity() : EREntity{
        return actor as EREntity
    }

    val entity: Entity
        get() = (super.actor as EREntity).entity!!

    fun isNotEnd(startTimeMillis: Long, durationTicks: Long): Boolean {
        return System.currentTimeMillis() - startTimeMillis < durationTicks * 50
    }

    val eREngine: EREngine
        get() = this.dpEngine as EREngine
}