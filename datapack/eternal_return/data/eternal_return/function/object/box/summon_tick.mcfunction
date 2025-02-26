## 상자 스코어
# 상위 함수 : function eternal_return:object/box/tick
# 입출력 없음

# 스코어보드 추가
execute if score @s ct1 matches 1.. run scoreboard players remove @s ct1 1
# 상자 마크 표기 생성
    execute if score @s ct1 matches 599 run kill @e[tag=box_info]
    execute if score @s ct1 matches 599 run function eternal_return:object/box/info/summon

# 사운드 / 파티클
    execute if score @s ct1 matches 1 run particle campfire_cosy_smoke ~ ~0.1 ~ 0.5 0.5 0.5 0.05 20
    execute if score @s ct1 matches 1 run playsound entity.horse.armor master @a ~ ~ ~ 1 0.8
    
# 위치 표기 마커 제거
    execute if score @s ct1 matches 1 run kill @e[type=item_display,distance=..1,tag=box_info]

# 특수효과
    execute if score @s ct1 matches 1 if entity @s[tag=mythic_box] run summon firework_rocket ~ ~1 ~ {LifeTime:30,FireworksItem:{id:"minecraft:firework_rocket",count:1,components:{"minecraft:fireworks":{explosions:[{shape:"large_ball",colors:[I;16711680]}]}}}}
# 상자 소환
    execute if score @s ct1 matches 1 if entity @s[tag=food_box] run function eternal_return:object/box/food/summon
    execute if score @s ct1 matches 1 if entity @s[tag=epic_box] run function eternal_return:object/box/epic/summon
    execute if score @s ct1 matches 1 if entity @s[tag=mythic_box] run function eternal_return:object/box/mythic/summon