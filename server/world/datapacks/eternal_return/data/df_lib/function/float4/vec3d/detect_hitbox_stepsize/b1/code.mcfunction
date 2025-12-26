function df_lib:float4/vec3d/get_entity_pos/main
scoreboard players operation #hitBoxPosX float = #float4.vec3d.get_entity_pos.x float
scoreboard players operation #hitBoxPosY float = #float4.vec3d.get_entity_pos.y float
scoreboard players operation #hitBoxPosZ float = #float4.vec3d.get_entity_pos.z float
execute as @e[type=minecraft:arrow,distance=..2] run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/code
scoreboard players reset #hitBoxPosX float
scoreboard players reset #hitBoxPosY float
scoreboard players reset #hitBoxPosZ float
