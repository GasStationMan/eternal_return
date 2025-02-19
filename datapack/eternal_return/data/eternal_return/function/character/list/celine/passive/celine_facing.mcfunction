execute if entity @s rotated as @a[tag=celine] run tp @s ^ ^ ^1
execute unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last"]}



scoreboard players add @s celine_facing 1
execute if score @s celine_facing matches ..9 if block ~ ~ ~ minecraft:air as @s at @s run return run function eternal_return:character/list/celine/passive/celine_facing
kill @s