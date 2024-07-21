execute store result entity @s Pos[0] double 0.01 run scoreboard players get #vecX ER.sys
execute store result entity @s Pos[1] double 0.01 run scoreboard players get #vecY ER.sys
execute store result entity @s Pos[2] double 0.01 run scoreboard players get #vecZ ER.sys
execute store result entity @s Motion[0] double 0.01 run scoreboard players get #motionX ER.sys
execute store result entity @s Motion[1] double 0.01 run scoreboard players get #motionY ER.sys
execute store result entity @s Motion[2] double 0.01 run scoreboard players get #motionZ ER.sys
execute store result score @s ER.motionX run data get entity @s Motion[0] 100
execute store result score @s ER.motionY run data get entity @s Motion[1] 100
execute store result score @s ER.motionZ run data get entity @s Motion[2] 100
tag @s add ER.arrow
tag @e[tag= this] remove this
