## 상자 재설치
# 입출력 없음
# 상위 함수 : function eternal_return:object/chest/set
# 필드 상자 리젠 함수
    function eternal_return:object/chest/remove
    function eternal_return:object/chest/summon

# 지역별 피자상자 추가

    tag @e[type=marker,limit=1,tag=alley] add pizza
    tag @e[type=marker,limit=1,tag=archery_range] add pizza
    tag @e[type=marker,limit=1,tag=police_station] add pizza
    tag @e[type=marker,limit=1,tag=fire_station] add pizza
    tag @e[type=marker,limit=1,tag=temple] add pizza
    tag @e[type=marker,limit=1,tag=stream] add pizza
    tag @e[type=marker,limit=1,tag=pond] add pizza
    tag @e[type=marker,limit=1,tag=hospital] add pizza
    tag @e[type=marker,limit=1,tag=cemetery] add pizza
    tag @e[type=marker,limit=1,tag=chapel] add pizza
    tag @e[type=marker,limit=1,tag=factory] add pizza
    tag @e[type=marker,limit=1,tag=dock] add pizza
    tag @e[type=marker,limit=1,tag=warehouse] add pizza
    tag @e[type=marker,limit=1,tag=uptown] add pizza
    tag @e[type=marker,limit=1,tag=beach] add pizza
    tag @e[type=marker,limit=1,tag=forest] add pizza
    tag @e[type=marker,limit=1,tag=hotel] add pizza
    tag @e[type=marker,limit=1,tag=school] add pizza
    tag @e[type=marker,limit=1,tag=gas_station] add pizza


## 상자 생성
    execute as @e[type=marker,tag=chestplace,tag=!pizza] at @s run setblock ~ ~ ~ minecraft:barrel[facing=up]{LootTable:"eternal_return:chests/normal"}
    execute as @e[type=marker,tag=chestplace,tag=pizza] at @s run setblock ~ ~ ~ minecraft:barrel[facing=up]{LootTable:"eternal_return:chests/normal_pizza"}