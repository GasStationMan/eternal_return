## 플레이어 날리기
scoreboard players set @s ct2 0
scoreboard players set @s ct1 0

# 돼지소환
$summon pig ~ ~ ~ {Silent:1b,Invulnerable:1b,Motion:$(vector),Tags:["jumping"],active_effects:[{id:"minecraft:resistance",amplifier:10,duration:100,show_particles:0b},{id:"minecraft:invisibility",amplifier:1,duration:300,show_particles:0b}],ArmorItems:[{},{},{},{id:"minecraft:stone",count:1,components:{"minecraft:custom_data":{Tags:a}}}]}
# 돼지 쿨타임 설정
execute as @e[tag=jumping] unless entity @s[scores={ct1=0}] run scoreboard players set @s ct1 0
# 돼지에서 가장 가까운 점프패드의 고유태그 가져오기
execute as @e[tag=jumping] at @s run data modify entity @s Tags prepend from entity @e[tag=jumppad,limit=1,sort=nearest] ArmorItems[3].components.minecraft:custom_data.Tags
execute as @e[tag=jumping] at @s run data modify entity @s ArmorItems[3].components.minecraft:custom_data.Tags set from entity @e[tag=jumppad,limit=1,sort=nearest] ArmorItems[3].components.minecraft:custom_data.Tags