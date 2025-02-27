## 스킬 초기화
# 상위 함수 없음
# 입출력 없음

# 스코어보드 초기화
    scoreboard players set @s active_level 0
    scoreboard players set @s passive_level 0
    scoreboard players set @s skill_exp 0
    scoreboard players set @s skill_point 0

# 플레이어 데이터 초기화
    function pdb:get_me
        execute store result storage pdb:main in.character.alevel int 1 run scoreboard players get @s[tag=this.] active_level
        execute store result storage pdb:main in.character.plevel int 1 run scoreboard players get @s[tag=this.] passive_level
    function pdb:save_me

# 스킬 아이템 아이콘 업데이트
    function eternal_return:character/skill/set_icon