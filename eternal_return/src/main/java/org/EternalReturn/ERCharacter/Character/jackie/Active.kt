package org.EternalReturn.ERCharacter.Character.jackie

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterSwapHandEvent
import org.EternalReturn.Util.dpengine.behaviour.MonobehaviourEvent

class Active : ERCharacterMonobehaviour<CharacterSwapHandEvent>() {
    private var skillActiveTick: Long = 0
    private val durationMillis: Long = 5000 // 5초 (5000ms)
    private var isActive = false

    public override fun start(event: CharacterSwapHandEvent) {
        val player = getPlayer()

        // 스킬이 이미 켜져 있다면 중복 발동 방지 (선택 사항)
        if (isActive) return

        // 현재 시간을 기록하고 활성화 상태로 변경
        this.skillActiveTick = System.currentTimeMillis()
        this.isActive = true
        (actor as Character_Jackie).isBloodSweep = true;

        player.sendMessage("§c[재키] §f스킬 발동! 5초간 유지됩니다.")
    }

    public override fun update(eventList: MutableCollection<MonobehaviourEvent>) {
        // 스킬이 활성화된 상태에서만 시간 체크
        if (isActive) {
            val currentTime = System.currentTimeMillis()

            // 시작한 시간으로부터 5초가 지났는지 확인
            if (currentTime - skillActiveTick > durationMillis) {
                isActive = false // 상태 종료
                getPlayer().sendMessage("§7[재키] 스킬 상태가 종료되었습니다.")
            }
        }
    }
}