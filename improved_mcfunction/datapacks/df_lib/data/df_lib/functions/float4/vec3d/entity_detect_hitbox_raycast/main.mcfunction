execute at @s if entity @e[type=#hitbox,tag=df_lib_hitbox,distance=1..10] run function df_lib:float4/vec3d/entity_detect_hitbox_raycast/b1/code
scoreboard players reset #nx float
scoreboard players reset #ny float
scoreboard players reset #nz float
scoreboard players reset #ox float
scoreboard players reset #oy float
scoreboard players reset #oz float
