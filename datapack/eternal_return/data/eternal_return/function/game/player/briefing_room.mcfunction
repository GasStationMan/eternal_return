## 브리핑 룸
# 상위 함수 : function eternal_return:game/tick

    function pdb:get_me
    # 인터페이스 표기
        # 상단 중앙 UI
            execute if entity @s[tag=waiting] run function eternal_return:gui/bossbar/display/interface
        # 대기 중인 인원 / 남은 시간 UI
            execute if score #wait.remaining CT1 matches 6.. if entity @s[tag=waiting] run function eternal_return:gui/bossbar/display/wait_bar
        # 곧 이동 텍스트 UI
            execute if score #wait.remaining CT1 matches ..5 if entity @s[tag=waiting] run function eternal_return:gui/bossbar/display/now_bar

    # 포션 효과
        effect clear @s invisibility
        effect give @s saturation infinite 100 true
        effect give @s resistance infinite 100 true