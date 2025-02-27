execute store result score @s health_check_80 run attribute @s minecraft:max_health get 0.8
execute if score @s health >= @s health_check_80 run tag @s add yuki_passive_skill

execute if entity @s[tag=yuki_passive_skill] at @s run function eternal_return:character/list/yuki/passive/skill

execute if score @s health < @s health_check_80 run tag @s remove yuki_passive_skill