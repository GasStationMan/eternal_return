scoreboard players add @s markus_hit 1
execute if score @s markus_hit matches 1 run particle minecraft:enchanted_hit ~ ~1 ~ 0.5 0.5 0.5 0 10
execute if score @s markus_hit matches 1 run say 악
execute if score @s markus_hit matches 1 if entity @n[tag=markus,scores={active_level=1}] run damage @s 4 magic by @n[tag=markus_skill]
execute if score @s markus_hit matches 1 if entity @n[tag=markus,scores={active_level=2}] run damage @s 5 magic by @n[tag=markus_skill]
execute if score @s markus_hit matches 1 if entity @n[tag=markus,scores={active_level=3}] run damage @s 6 magic by @n[tag=markus_skill]
execute if score @s markus_hit matches 1 if entity @n[tag=markus,scores={active_level=4}] run damage @s 7 magic by @n[tag=markus_skill]
execute if score @s markus_hit matches 1 if entity @n[tag=markus,scores={active_level=5}] run damage @s 8 magic by @n[tag=markus_skill]
execute if score @s markus_hit matches 1.. run effect give @s slowness 1 0

execute if score @s markus_hit matches 20.. run tag @s remove markus_hit

execute unless entity @s[tag=markus_hit] run effect clear @s slowness
execute unless entity @s[tag=markus_hit] run scoreboard players reset @s markus_hit
