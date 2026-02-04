package org.EternalReturn.ERCharacter.Character.yuki

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterAttackEvent
import org.EternalReturn.EREntity.Event.EREntityStunEvent
import org.EternalReturn.util.dpengine.behaviour.MonobehaviourEvent
import org.bukkit.Location
import org.bukkit.Sound
import org.bukkit.entity.LivingEntity
import org.bukkit.potion.PotionEffect
import org.bukkit.potion.PotionEffectType

class Passive : ERCharacterMonobehaviour<CharacterAttackEvent>() {
    private var reloadStartTime: Long = 0
    private val reloadDuration: Long = 2000 // 2초
    private var punchTimeMillis: Long = 0
    private val stunnedVictims: MutableMap<LivingEntity?, Location?> = HashMap<LivingEntity?, Location?>()
    private var stunTimer = 0
    private var isActiveAttack = false

    override fun start(event: CharacterAttackEvent) {
        // 자바 클래스인 Character_Yuki로 형변환
        val yuki = actor as Character_Yuki
        val player = getPlayer()

        val victimEntity = event.victim.entity

        if (victimEntity !is LivingEntity) {
            return
        }

        if (System.currentTimeMillis() < punchTimeMillis) {
            return
        }
        punchTimeMillis = System.currentTimeMillis() + 10 * 50


        // 1. 재봉 중이면 공격 취소
        if (yuki.isReloading) {
            player.sendMessage("§f[유키] §7옷매무새 중에는 공격할 수 없습니다.")
            return
        }


        // 2. 단추 소모 및 강화
        if (yuki.buttonCount > 0) {
            yuki.buttonCount--

            punchTimeMillis = System.currentTimeMillis() + 500
            victimEntity.noDamageTicks = 0
            victimEntity.damage(2.0, player)

            player.sendMessage("§f[유키] §b완벽한 옷매무새: §f남은 단추 (${yuki.buttonCount}/4)")
            player.playSound(player.location, Sound.ENTITY_ITEM_BREAK, 1f, 1.8f)

            if (yuki.isActiveSkill) {
                player.sendMessage("§f[유키] 머리!")
                event.victim.submitEvent(EREntityStunEvent(2 * 20)) //2초
                yuki.isActiveSkill = false
            }

            // 3. 단추가 없으면 재봉 모드 돌입
            if (yuki.buttonCount == 0) {
                yuki.isReloading = true
                reloadStartTime = System.currentTimeMillis()
                player.sendMessage("§f[유키] §e옷매무새 정리 중...")
                player.addPotionEffect(PotionEffect(PotionEffectType.WEAKNESS, 40, 100, false, false))
                player.playSound(player.location, Sound.BLOCK_IRON_HIT, 1f, 1.2f)
            }
        }
    }

    override fun update(eventList: MutableCollection<MonobehaviourEvent>) {
        val yuki = actor as Character_Yuki
        // 4. 재봉 시간 체크
        if (yuki.isReloading) {
            if (System.currentTimeMillis() - reloadStartTime >= reloadDuration) {
                yuki.isReloading = false
                yuki.buttonCount = 4
                getPlayer().sendMessage("§f[유키] §a재봉 완료! §f단추가 다시 채워졌습니다.")
                getPlayer().playSound(getPlayer().location, Sound.ENTITY_EXPERIENCE_ORB_PICKUP, 1f, 1.5f)
            }
            return;
        }
        stopMonobehav();
    }
}