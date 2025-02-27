scoreboard players add @s elena_active_skill 1

particle dust{color:[0.000,0.933,1.000],scale:1} ~ ~0.1 ~ 2 0 2 0 10 force
effect give @e[distance=..4,tag=!elena,scores={passive_level=..2}] slowness 1 0
effect give @e[distance=..4,tag=!elena,scores={passive_level=3..4}] slowness 1 1
effect give @e[distance=..4,tag=!elena,scores={passive_level=5}] slowness 1 2
effect give @e[distance=..4,tag=elena] strength 1 0
effect give @e[distance=..4,tag=elena] fire_resistance 1 0

execute if score @s elena_active_skill matches 140.. run kill @s
execute if score @s elena_active_skill matches 140.. run tag @n[tag=elena] remove elena_active_skill