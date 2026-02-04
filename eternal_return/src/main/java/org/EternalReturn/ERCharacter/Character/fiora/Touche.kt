package org.EternalReturn.ERCharacter.Character.fiora

import org.bukkit.Particle
import org.bukkit.Sound
import org.bukkit.entity.LivingEntity
import org.bukkit.entity.Player

object Touche {
    private val stacks = mutableMapOf<LivingEntity, Int>()
    private val lastHitTimes = mutableMapOf<LivingEntity, Long>()
    private const val STACK_DURATION = 5000L

    // 스택 추가 및 4스택 체크 로직
    fun applyStack(player: Player, victim: LivingEntity) {
        val currentTime = System.currentTimeMillis()
        val currentStack = stacks.getOrDefault(victim, 0)
        val nextStack = currentStack + 1

        if (nextStack < 5) {
            stacks[victim] = nextStack
            lastHitTimes[victim] = currentTime

            player.sendMessage("§f[피오라] §e팡뜨 스택: §f$nextStack / 4")
            player.playSound(player.location, Sound.BLOCK_NOTE_BLOCK_CHIME, 1f, 1f + (nextStack * 0.2f))
        } else {
            // 4스택 폭발
            resetStack(victim)

            victim.noDamageTicks = 0
            victim.damage(8.0, player) // 추가 피해
            player.health = (player.health + 4.0).coerceAtMost(player.maxHealth) // 흡혈

            player.sendMessage("§f[피오라] §b§l팡뜨! §f적중")
            player.playSound(player.location, Sound.ENTITY_GENERIC_EXPLODE, 0.5f, 1.8f)
            //victim.world.spawnParticle(Particle.FLASH, victim.location.add(0.0, 1.0, 0.0), 1)
        }
    }

    fun resetStack(victim: LivingEntity) {
        stacks.remove(victim)
        lastHitTimes.remove(victim)
    }

    fun getStacks(): Map<LivingEntity, Int> = stacks

    fun isExpired(victim: LivingEntity): Boolean {
        val time = lastHitTimes[victim] ?: return true
        return System.currentTimeMillis() - time > STACK_DURATION
    }
}