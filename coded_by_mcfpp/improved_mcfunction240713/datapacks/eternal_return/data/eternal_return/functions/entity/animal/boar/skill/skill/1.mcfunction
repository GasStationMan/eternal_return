tp @s ~ ~2.5 ~
execute store result entity @s Motion[0] double 0.000008 run scoreboard players get #dx ER.sys
execute store result entity @s Motion[1] double 0.000008 run scoreboard players get #dy ER.sys
execute store result entity @s Motion[2] double 0.000008 run scoreboard players get #dz ER.sys
damage @p[tag=skillTargeted] 5 minecraft:player_attack
ride @p[tag=skillTargeted] mount @s
tag @a[tag=skillTargeted] remove skillTargeted
