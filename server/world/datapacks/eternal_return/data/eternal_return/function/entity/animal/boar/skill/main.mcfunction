execute on passengers at @s run function eternal_return:entity/animal/boar/skill/b1/code
execute as @a[tag=skillTargeted] at @s run function eternal_return:entity/animal/boar/skill/b2/code
execute store result entity @s Motion[0] double 0.00005 run scoreboard players get #dx ER.sys
execute store result entity @s Motion[2] double 0.00005 run scoreboard players get #dz ER.sys
