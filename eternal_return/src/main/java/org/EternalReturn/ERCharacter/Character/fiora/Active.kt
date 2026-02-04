package org.EternalReturn.ERCharacter.Character.fiora

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterSwapHandEvent
import org.EternalReturn.EREntity.Event.ERToucheCountEvent
import org.EternalReturn.System.PluginInstance
import org.EternalReturn.util.dpengine.behaviour.MonobehaviourEvent
import org.bukkit.Particle
import org.bukkit.Sound
import org.bukkit.entity.LivingEntity
import org.bukkit.entity.Player

class Active : ERCharacterMonobehaviour<CharacterSwapHandEvent>() {
    private var skillTimer = 0

    override fun start(event: CharacterSwapHandEvent) {
        skillTimer = 0
        getPlayer().sendMessage("§f[피오라] §b아따끄 꽁뽀제!")
    }

    override fun update(eventList: MutableCollection<MonobehaviourEvent>) {

        skillTimer++
        val player = getPlayer()

        // 1타 (4틱)
        if (skillTimer == 4) {
            handleHit(player, 3.0, false) // 1타는 자연스럽게 이벤트로 스택 쌓기
        }

        // 2타 (10틱)
        if (skillTimer >= 10) {
            handleHit(player, 4.0, true) // 2타는 무적 시간 때문에 강제로 스택 쌓기

            // 스킬 종료 처리
            stopMonobehav()
        }
    }

    // 공격 로직 통합
    private fun handleHit(player: Player, damage: Double, forceStack: Boolean) {
        player.playSound(player.location, Sound.ENTITY_PLAYER_ATTACK_SWEEP, 1f, if (forceStack) 1.4f else 1.0f)
        player.world.spawnParticle(Particle.SWEEP_ATTACK, player.eyeLocation.add(player.location.direction.multiply(1.5)), 1)

        for (entity in player.getNearbyEntities(2.5, 2.5, 2.5)) {
            if (entity is LivingEntity && entity != player) {
                val toTarget = entity.location.toVector().subtract(player.location.toVector()).normalize()
                if (player.location.direction.dot(toTarget) > 0.7) {

                    entity.noDamageTicks = 0
                    entity.damage(damage, player)

                    val victim = PluginInstance.getEREngine().getEREntity(entity);
                    if(victim == null)return;
                    victim.submitEvent(ERToucheCountEvent(player));
                }
            }
        }
    }
}