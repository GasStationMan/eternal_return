execute on passengers at @s run function eternal_return:entity/animal/boar/skill/skill/0
execute as @a[tag=skillTargeted] at @s summon minecraft:snowball run function eternal_return:entity/animal/boar/skill/skill/1
execute store result entity @s Motion[0] double 0.00006 run scoreboard players get #dx ER.sys
execute store result entity @s Motion[2] double 0.00006 run scoreboard players get #dz ER.sys
