package org.EternalReturn.Util.dpengine.command

import org.bukkit.entity.Entity


class SetSpigotEntityPosition(
    val entity : Entity,
    val x : Double, val y : Double, val z : Double,
) : Command(){

    override fun run() {
        this.entity.location.x = x;
        this.entity.location.y = y;
        this.entity.location.z = z;
        this.entity.teleport(entity.location);
    }
}