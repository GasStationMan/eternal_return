package org.EternalReturn.util.dpengine.command

import org.bukkit.entity.Entity
import org.bukkit.util.Vector


class SetSpigotEntityVelocity(
    val entity : Entity,
    val x : Double, val y : Double, val z : Double
) : Command(){

    override fun run() {
        println("$entity's velocity = [${this.entity.velocity.x}, ${this.entity.velocity.y}, ${this.entity.velocity.z}]" )

        this.entity.velocity = Vector(x, y, z)

        println("$entity's velocity = [${this.entity.velocity.x}, ${this.entity.velocity.y}, ${this.entity.velocity.z}]" )

    }
}