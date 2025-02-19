execute if entity @s[tag=celine_facing_t1] rotated as @a[tag=celine_t1] run tp @s ^ ^ ^1
execute if entity @s[tag=celine_facing_t2] rotated as @a[tag=celine_t2] run tp @s ^ ^ ^1
execute if entity @s[tag=celine_facing_t3] rotated as @a[tag=celine_t3] run tp @s ^ ^ ^1
execute if entity @s[tag=celine_facing_t4] rotated as @a[tag=celine_t4] run tp @s ^ ^ ^1
execute if entity @s[tag=celine_facing_t5] rotated as @a[tag=celine_t5] run tp @s ^ ^ ^1
execute if entity @s[tag=celine_facing_t6] rotated as @a[tag=celine_t6] run tp @s ^ ^ ^1
execute if entity @s[tag=celine_facing_t7] rotated as @a[tag=celine_t7] run tp @s ^ ^ ^1
execute if entity @s[tag=celine_facing_t8] rotated as @a[tag=celine_t8] run tp @s ^ ^ ^1
execute if entity @s[tag=celine_facing_t9] rotated as @a[tag=celine_t9] run tp @s ^ ^ ^1
execute if entity @s[tag=celine_facing_t10] rotated as @a[tag=celine_t10] run tp @s ^ ^ ^1
execute if entity @s[tag=celine_facing_t11] rotated as @a[tag=celine_t11] run tp @s ^ ^ ^1
execute if entity @s[tag=celine_facing_t12] rotated as @a[tag=celine_t12] run tp @s ^ ^ ^1
execute if entity @s[tag=celine_facing_t13] rotated as @a[tag=celine_t13] run tp @s ^ ^ ^1
execute if entity @s[tag=celine_facing_t14] rotated as @a[tag=celine_t14] run tp @s ^ ^ ^1
execute if entity @s[tag=celine_facing_t15] rotated as @a[tag=celine_t15] run tp @s ^ ^ ^1
execute if entity @s[tag=celine_facing_t16] rotated as @a[tag=celine_t16] run tp @s ^ ^ ^1

execute if entity @s[tag=celine_facing_t1] unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last","celine_facing_last_t1"]}
execute if entity @s[tag=celine_facing_t2] unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last","celine_facing_last_t2"]}
execute if entity @s[tag=celine_facing_t3] unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last","celine_facing_last_t3"]}
execute if entity @s[tag=celine_facing_t4] unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last","celine_facing_last_t4"]}
execute if entity @s[tag=celine_facing_t5] unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last","celine_facing_last_t5"]}
execute if entity @s[tag=celine_facing_t6] unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last","celine_facing_last_t6"]}
execute if entity @s[tag=celine_facing_t7] unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last","celine_facing_last_t7"]}
execute if entity @s[tag=celine_facing_t8] unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last","celine_facing_last_t8"]}
execute if entity @s[tag=celine_facing_t9] unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last","celine_facing_last_t9"]}
execute if entity @s[tag=celine_facing_t10] unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last","celine_facing_last_t10"]}
execute if entity @s[tag=celine_facing_t11] unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last","celine_facing_last_t11"]}
execute if entity @s[tag=celine_facing_t12] unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last","celine_facing_last_t12"]}
execute if entity @s[tag=celine_facing_t13] unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last","celine_facing_last_t13"]}
execute if entity @s[tag=celine_facing_t14] unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last","celine_facing_last_t14"]}
execute if entity @s[tag=celine_facing_t15] unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last","celine_facing_last_t15"]}
execute if entity @s[tag=celine_facing_t16] unless block ~ ~ ~ air positioned over world_surface run summon area_effect_cloud ~ ~ ~ {Tags:["celine_facing_last","celine_facing_last_t16"]}



scoreboard players add @s celine_facing 1
execute if score @s celine_facing matches ..9 if block ~ ~ ~ minecraft:air as @s at @s run return run function eternal_return:character/list/celine/passive/celine_facing
kill @s