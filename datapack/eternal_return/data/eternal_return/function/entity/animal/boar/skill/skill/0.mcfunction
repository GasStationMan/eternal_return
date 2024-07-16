execute store result score @s ER.UUID.0 run data get entity @p[tag=targeted] UUID[0]
execute store result score @s ER.UUID.1 run data get entity @p[tag=targeted] UUID[1]
execute store result score @s ER.UUID.2 run data get entity @p[tag=targeted] UUID[2]
execute store result score @s ER.UUID.3 run data get entity @p[tag=targeted] UUID[3]
execute store result entity @s Motion[0] double 0.000005 run scoreboard players get #dx ER.sys
execute store result entity @s Motion[1] double 0.000005 run scoreboard players get #dy ER.sys
execute store result entity @s Motion[2] double 0.000005 run scoreboard players get #dz ER.sys
ride @p[tag=targeted] mount @s
tag @s remove this
say 날아간다~~
