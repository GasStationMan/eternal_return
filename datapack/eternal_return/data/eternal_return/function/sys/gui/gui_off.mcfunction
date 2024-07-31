#
#   필요 태그 : ER.gui_off
#

## GUi 종료선언

    # 보스바 비우기
    tag @s add clear_bossbar
    # 액션바 비우기
    title @s actionbar ""
    # 타이틀 비우기
    title @s title ""
    title @s subtitle ""
    # 표기 시간 
    title @s times 0 0 0

    # 핫바 비우기
    clear @s warped_fungus_on_a_stick

    # 포션효과 제거
    effect clear @s invisibility
    effect clear @s resistance
    
    # 태그 제거
    tag @s remove ER.has_blankItem
    tag @s remove ER.gui_on
    tag @s remove ER.gui_off