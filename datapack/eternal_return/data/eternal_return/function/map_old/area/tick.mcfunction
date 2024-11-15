## 구역 지정

# 구역 별 데이터 type 숫자 변경
execute as @e[tag=scheduled_restricted_zone,tag=zplace] run data modify entity @s data.type set value 1
execute as @e[tag=restricted_zone,tag=zplace] run data modify entity @s data.type set value 2
execute as @e[tag=scheduled_battle_zone,tag=zplace] run data modify entity @s data.type set value 3
execute as @e[tag=battle_zone,tag=zplace] run data modify entity @s data.type set value 4











#execute if entity @e[tag=sort_low_score] run scoreboard objectives add sorting dummy
#execute if entity @e[tag=sort_low_score] run data remove storage score low
#execute if entity @e[tag=sort_low_score] run function eternal_return:map/area/sort_low
#execute if entity @e[tag=sort_low_score] run scoreboard objectives remove sorting
#execute if entity @e[tag=sort_low_score] run tag @e[tag=dones] remove dones
#execute if entity @e[tag=sort_low_score] run tag @e[tag=lowscore] remove lowscore
#execute if entity @e[tag=sort_low_score] run tag @e[tag=sort_low_score] remove sort_low_score
