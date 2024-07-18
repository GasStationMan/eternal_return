particle minecraft:flame ~ ~ ~ 0 0 0 0 1 force @a
tp @s ^ ^ ^1
tag @a[tag=! skillTargeted, distance=..2] add skillTargeted
scoreboard players add #i ER.sys 1
say getTarget Called
execute if score #i ER.sys matches ..9 as @s at @s run return run function eternal_return:entity/animal/boar/skill/skill/skill/0

kill @s
