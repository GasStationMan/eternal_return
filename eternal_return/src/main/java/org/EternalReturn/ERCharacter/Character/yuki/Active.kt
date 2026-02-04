package org.EternalReturn.ERCharacter.Character.yuki

import org.EternalReturn.ERCharacter.Character.jackie.Character_Jackie
import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterSwapHandEvent
import org.EternalReturn.util.dpengine.behaviour.MonobehaviourEvent
import org.bukkit.Sound

class Active : ERCharacterMonobehaviour<CharacterSwapHandEvent>() {
    private var skillActiveTick: Long = 0
    private val durationMillis: Long = 5000 // 5초 유지
    private var isActive = false

    override fun start(event: CharacterSwapHandEvent) {
        val yuki = actor as Character_Yuki
        val player = getPlayer()

        // 단추가 없거나 재봉 중이면 발동 불가
        if (yuki.buttonCount <= 0 || yuki.isReloading) {
            player.sendMessage("§f[유키] §7단추가 부족하거나 재봉 중에는 스킬을 사용할 수 없습니다.")
            return
        }

        if (isActive) return

        this.skillActiveTick = System.currentTimeMillis()
        this.isActive = true
        (actor as Character_Yuki).isActiveSkill = true;

        player.sendMessage("§f[유키] §b머리치기!: §f다음 공격에 기절을 부여합니다!")
        player.playSound(player.location, Sound.BLOCK_SNOW_BREAK, 1f, 1.5f)
    }

    // 사진 3번의 오류를 해결하기 위해 반드시 포함되어야 하는 메서드입니다.
    override fun update(eventList: MutableCollection<MonobehaviourEvent>) {
        if (isActive) {
            val yuki = actor as Character_Yuki

            val currentTime = System.currentTimeMillis()

            // 5초가 지났거나 공격 성공으로 스킬이 이미 소모되었다면 비활성화
            if (currentTime - skillActiveTick > durationMillis || !yuki.isActiveSkill) {
                this.isActive = false
                yuki.isActiveSkill = false
                (actor as Character_Yuki).isActiveSkill = false
                getPlayer().sendMessage("§7[유키] 스킬 상태가 종료되었습니다.")
            }
        }
    }
}