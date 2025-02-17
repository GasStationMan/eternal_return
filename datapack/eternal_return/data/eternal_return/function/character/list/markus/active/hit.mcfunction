scoreboard players add @s markus_hit 1
execute if score @s markus_hit matches 1 run particle minecraft:enchanted_hit ~ ~1 ~ 0.5 0.5 0.5 0 10
execute if score @s markus_hit matches 1 run say 악
execute if score @s markus_hit matches 1 run damage @s 1 generic by @n[tag=markus_skill]
execute if score @s markus_hit matches 1.. run effect give @s slowness 1 1

execute if score @s[scores={active_skill=1}] markus_hit matches 20.. run tag @s remove markus_hit
execute if score @s[scores={active_skill=2}] markus_hit matches 24.. run tag @s remove markus_hit
execute if score @s[scores={active_skill=3}] markus_hit matches 28.. run tag @s remove markus_hit
execute if score @s[scores={active_skill=4}] markus_hit matches 32.. run tag @s remove markus_hit
execute if score @s[scores={active_skill=5}] markus_hit matches 40.. run tag @s remove markus_hit

execute unless entity @s[tag=markus_hit] run scoreboard players reset @s markus_hit
execute unless entity @s[tag=markus_hit] run effect clear @s slowness