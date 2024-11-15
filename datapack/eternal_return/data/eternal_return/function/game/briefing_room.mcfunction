## 브리핑 룸
# 상위 함수 : function eternal_return:game/tick

    # 인터페이스 표기
    function pdb:get_me
        execute if entity @s[tag=waiting] run function eternal_return:gui/bossbar/display/interface with storage pdb:main args


    # 포션 효과
        effect clear @s invisibility
        effect give @s saturation infinite 100 true
        effect give @s resistance infinite 100 true