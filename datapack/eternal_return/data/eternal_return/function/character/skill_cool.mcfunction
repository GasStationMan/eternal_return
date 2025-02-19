## 스킬 쿨타임
# 상위 함수 : function eternal_return:character/tick
# 입출력 없음

# 변수 설명
# passive_cool, active_cool = 쿨타임 sec
# passive_tick, active_tick = 쿨타임 tick
# 스킬 쿨타임 작동시 쿨타임 숫자와 쿨타임 명암이미지 추가

# 플레이어 데이터 불러오기
function pdb:get_me

## 액티브
    # 스킬 사용시 이미지 변경
        execute if entity @s[tag=!active_cool] run data modify storage pdb:main in.character.active_cool_image set value 0
        execute if entity @s[tag=active_cool] run data modify storage pdb:main in.character.active_cool_image set value 1
    # 쿨타임 태그
        execute if score @s[tag=!active_cool] active_cool matches 1.. run scoreboard players set @s active_tick 0
        execute if score @s[tag=!active_cool] active_cool matches 1.. run tag @s add active_cool
        execute if score @s active_cool matches 0 run tag @s remove active_cool
    # 스킬 시간 연산
        execute if score @s[tag=active_cool] active_cool matches 1.. run scoreboard players add @s active_tick 1
        execute if score @s[tag=active_cool] active_cool matches 1.. if score @s active_tick matches 20.. run scoreboard players remove @s active_cool 1
        execute if score @s[tag=active_cool] active_cool matches 1.. if score @s active_tick matches 20.. run scoreboard players set @s active_tick 0

## 패시브
    # 스킬 사용시 태그 설정
        execute if entity @s[tag=!passive_cool] run data modify storage pdb:main in.character.passive_cool_image set value 0
        execute if entity @s[tag=passive_cool] run data modify storage pdb:main in.character.passive_cool_image set value 1
    # 쿨타임 태그
        execute if score @s[tag=!passive_cool] passive_cool matches 1.. run scoreboard players set @s passive_tick 0
        execute if score @s[tag=!passive_cool] passive_cool matches 1.. run tag @s add passive_cool
        execute if score @s passive_cool matches ..0 run scoreboard players set @s passive_cool 0
        execute if score @s passive_cool matches 0 run tag @s remove passive_cool
    # 스킬 시간 연산
        execute if score @s[tag=passive_cool] passive_cool matches 1.. run scoreboard players add @s passive_tick 1
        execute if score @s[tag=passive_cool] passive_cool matches 1.. if score @s passive_tick matches 20.. run scoreboard players remove @s passive_cool 1
        execute if score @s[tag=passive_cool] passive_cool matches 1.. if score @s passive_tick matches 20.. run scoreboard players set @s passive_tick 0

# 플레이어 데이터 저장하기
function pdb:save_me