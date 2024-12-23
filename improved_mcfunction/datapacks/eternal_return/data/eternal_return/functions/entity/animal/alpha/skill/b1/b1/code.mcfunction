function eternal_return:entity/animal/alpha/skill/b1/b1/b1/code
scoreboard players add #i ER.sys 1
execute if score #i ER.sys matches ..10 as @s rotated as @s positioned ^0.25 ^ ^ run function eternal_return:entity/animal/alpha/skill/b1/b1/code 
damage @s 10 minecraft:player_attack
tag @s remove float4.vector2d.detect_circular_sector
