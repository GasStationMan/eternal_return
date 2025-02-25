execute store result score @s health_check_40 run attribute @s minecraft:max_health get 0.4
execute store result score @s health_check_20 run attribute @s minecraft:max_health get 0.2

execute if score @s health <= @s health_check_40 run tag @s add sissela_passive_skill
execute if score @s health <= @s health_check_20 run tag @s add sissela_passive_skill_20

execute if entity @s[tag=sissela_passive_skill] at @s run function eternal_return:character/list/sissela/passive/skill

execute if score @s health > @s health_check_40 run tag @s remove sissela_passive_skill
execute if score @s health > @s health_check_20 run tag @s remove sissela_passive_skill_20