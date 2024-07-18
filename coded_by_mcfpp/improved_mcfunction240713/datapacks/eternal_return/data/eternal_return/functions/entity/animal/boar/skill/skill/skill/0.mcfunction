tp @s ^ ^ ^1
execute if entity @a[tag=! skillTargeted, distance=..2] run tag @a[tag=! skillTargeted, distance=..2] add skillTargeted
scoreboard players add #i ER.sys 1
execute if score #i ER.sys matches ..9 as @s at @s run return run function eternal_return:entity/animal/boar/skill/skill/skill/0

kill @s
