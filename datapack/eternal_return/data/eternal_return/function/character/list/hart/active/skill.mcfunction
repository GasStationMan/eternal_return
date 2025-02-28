scoreboard players add @e[tag=hart_move] hart_move 1
scoreboard players add @s[tag=hart_active_skill] hart_active_skill 1

execute if entity @s at @s run tp @e[tag=hart_move,distance=..0.1] ~ ~0.05 ~ ~ ~
execute as @e[tag=hart_move,scores={hart_move=1..}] at @s if block ^ ^ ^1 air run tp @s ^ ^ ^0.6
execute if entity @s at @s run tp @s @n[tag=hart_move]
execute as @e[tag=hart_move,scores={hart_move=5}] at @s run tag @e[distance=..5,tag=!hart,type=villager] add hart_target
execute as @e[tag=hart_move,scores={hart_move=5}] at @s if entity @e[distance=..5,tag=!hart,type=villager] run summon marker ~ ~ ~ {Tags:["hart_hit_marker"]}
execute as @e[tag=hart_move,scores={hart_move=5}] run kill @s

execute as @e[tag=hart_hit_marker] at @s run particle minecraft:note ~ ~1 ~ 0 0 0 0.3 3
execute as @e[tag=hart_hit_marker] at @s facing entity @n[tag=hart_target] feet run tp @s ^ ^ ^1
execute as @e[tag=hart_target] at @s if entity @e[distance=..1.5,tag=hart_hit_marker] if entity @n[tag=hart,scores={active_level=1}] run damage @s 1 magic by @n[tag=hart]
execute as @e[tag=hart_target] at @s if entity @e[distance=..1.5,tag=hart_hit_marker] if entity @n[tag=hart,scores={active_level=2}] run damage @s 2 magic by @n[tag=hart]
execute as @e[tag=hart_target] at @s if entity @e[distance=..1.5,tag=hart_hit_marker] if entity @n[tag=hart,scores={active_level=3}] run damage @s 3 magic by @n[tag=hart]
execute as @e[tag=hart_target] at @s if entity @e[distance=..1.5,tag=hart_hit_marker] if entity @n[tag=hart,scores={active_level=4}] run damage @s 4 magic by @n[tag=hart]
execute as @e[tag=hart_target] at @s if entity @e[distance=..1.5,tag=hart_hit_marker] if entity @n[tag=hart,scores={active_level=5}] run damage @s 5 magic by @n[tag=hart]

execute as @e[tag=hart_target] at @s if entity @e[distance=..1.5,tag=hart_hit_marker] run tag @s remove hart_target
execute as @e[tag=hart_hit_marker] at @s unless entity @e[tag=hart_target] run kill @s

execute if score @s hart_active_skill matches 100.. run scoreboard players add @s hart_active_count 1
execute if score @s hart_active_skill matches 100.. run scoreboard players reset @s hart_active_skill

execute if score @s[scores={active_level=1}] hart_active_count matches 2.. run scoreboard players set @s active_cool 30
execute if score @s[scores={active_level=2}] hart_active_count matches 2.. run scoreboard players set @s active_cool 28
execute if score @s[scores={active_level=3}] hart_active_count matches 2.. run scoreboard players set @s active_cool 26
execute if score @s[scores={active_level=4}] hart_active_count matches 2.. run scoreboard players set @s active_cool 24
execute if score @s[scores={active_level=5}] hart_active_count matches 2.. run scoreboard players set @s active_cool 20

execute if score @s hart_active_count matches 2.. run tag @s remove hart_active_skill
execute if score @s hart_active_count matches 2.. run scoreboard players reset @s hart_active_skill
execute if score @s hart_active_count matches 2.. run scoreboard players reset @s hart_active_count