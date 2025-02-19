execute if entity @s[tag=celine_facing_t1] rotated as @a[tag=celine_t1] run tp @s ^ ^ ^1
execute if entity @s[tag=celine_facing_t2] rotated as @a[tag=celine_t2] run tp @s ^ ^ ^1
execute if entity @s[tag=celine_facing_t1] unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last","celine_facing_last_t1"]}
execute if entity @s[tag=celine_facing_t2] unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last","celine_facing_last_t2"]}


scoreboard players add @s celine_facing 1
execute if score @s celine_facing matches ..9 if block ~ ~ ~ minecraft:air as @s at @s run return run function eternal_return:character/list/celine/passive/celine_facing
kill @s