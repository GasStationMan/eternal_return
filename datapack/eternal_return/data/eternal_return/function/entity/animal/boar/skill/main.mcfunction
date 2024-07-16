summon minecraft:marker ^ ^ ^1 {Tags:["vector"]}
execute store result score #x0 ER.sys run data get entity @s Pos[0] 100000
execute store result score #z0 ER.sys run data get entity @s Pos[2] 100000
execute store result score #x2 ER.sys run data get entity @e[type=minecraft:marker,tag=vector,limit=1] Pos[0] 100000
execute store result score #z2 ER.sys run data get entity @e[type=minecraft:marker,tag=vector,limit=1] Pos[2] 100000
scoreboard players operation #dx ER.sys = #x2 ER.sys
scoreboard players operation #dx ER.sys -= #x0 ER.sys
scoreboard players set #dy ER.sys 100000
scoreboard players operation #dz ER.sys = #z2 ER.sys
scoreboard players operation #dz ER.sys -= #z0 ER.sys
kill @e[type=minecraft:marker,tag=vector,limit=1]
summon minecraft:snowball ^ ^ ^2 {Tags:["this"]}
execute positioned as @s run tp @e[type=minecraft:snowball, tag= this] ~ ~1 ~
execute as @e[type=minecraft:snowball, tag= this] run function eternal_return:entity/animal/boar/skill/skill/0
execute store result score #return ER.sys run function eternal_return:entity/animal/boar/skill/skill/1
