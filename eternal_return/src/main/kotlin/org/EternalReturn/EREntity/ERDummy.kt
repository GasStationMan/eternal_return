package org.EternalReturn.EREntity

import org.EternalReturn.System.PluginInstance
import org.bukkit.entity.Entity
import org.bukkit.entity.LivingEntity

class ERDummy(entity: Entity) : EREntity(
    PluginInstance.getEREngine().createCylinder(
        PluginInstance.getEREngine().createInfStrightLine(
            0.0, 1.0, 0.0,
            entity.getLocation().getX(),
            entity.getLocation().getY(),
            entity.getLocation().getZ()
        ),
        1.0, 3.0
    )
) {
    init {
        this.entity = entity
        (entity as LivingEntity).setAI(false)

        //        registerMonobehaviour(new InfinityHealing());
    }
}
