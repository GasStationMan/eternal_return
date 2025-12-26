execute if entity @s[type=minecraft:interaction,tag=df_lib_hitbox] at @s positioned ~ ~-1 ~ if entity @p[distance=..10] run function df_lib:float4/vec3d/detect_hitbox_raycast/b1/code
