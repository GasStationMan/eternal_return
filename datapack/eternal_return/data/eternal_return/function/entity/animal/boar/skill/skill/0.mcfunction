say called
summon minecraft:marker ~ ~ ~ {Tags:["getTarget"]}
tp @e[type=minecraft:marker] ~ ~-1 ~ ~ ~
scoreboard players set #i ER.sys 0
execute as @e[type=minecraft:marker,tag=getTarget] at @s run function eternal_return:entity/animal/boar/skill/skill/skill/0
execute as @a[tag=skillTargeted] run say i am target
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
