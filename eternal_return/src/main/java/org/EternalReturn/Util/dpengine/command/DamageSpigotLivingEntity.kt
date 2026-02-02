package org.EternalReturn.Util.dpengine.command

import org.bukkit.entity.LivingEntity


class DamageSpigotLivingEntity(
    val entity : LivingEntity,
    val damage : Double
) : Command(){

    override fun run() {
        entity.damage(damage);
    }
}