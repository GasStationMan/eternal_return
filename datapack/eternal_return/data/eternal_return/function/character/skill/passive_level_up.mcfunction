## 스킬 레벨업
# 상위 함수 : function eternal_return:character/tick

# 예외
    tag @s remove passive_level_up
    execute if score @s skill_point matches 0 run return fail
    execute if score @s passive_level matches 5.. run return fail

# 레벨 업
    tag @s add this.

        # 소리 재생
            execute at @s run playsound block.bell.use master @s[tag=this.] ~ ~ ~ 1 2
        # 레벨 +1
            scoreboard players add @s[tag=this.] passive_level 1
        # 스킬포인트 -1
            scoreboard players remove @s[tag=this.] skill_point 1

        # 플레이어 데이터 저장
        function pdb:get_me
            execute store result storage pdb:main in.character.plevel int 1 run scoreboard players get @s[tag=this.] passive_level
        function pdb:save_me

        # 스킬 아이템 아이콘 업데이트
            function eternal_return:character/skill/set_icon

# 태그 제거
    tag @s[tag=this.] remove this.
