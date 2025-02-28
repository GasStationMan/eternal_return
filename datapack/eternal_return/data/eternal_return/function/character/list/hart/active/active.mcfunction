execute at @s run tp @s ~ ~ ~ ~ 0
execute at @s run summon marker ~ ~ ~ {Tags:["hart_move"]}

tag @s add hart_active_skill
scoreboard players add @s hart_active_count 1