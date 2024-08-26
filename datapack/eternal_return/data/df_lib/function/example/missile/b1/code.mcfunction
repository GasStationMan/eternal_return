function df_lib:float4/vec3d/get_entity_pos/main
scoreboard players operation #vx float = #float4.vec3d.get_entity_pos.x float
scoreboard players operation #vy float = #float4.vec3d.get_entity_pos.y float
scoreboard players operation #vz float = #float4.vec3d.get_entity_pos.z float
execute as @n[tag=target] run function df_lib:float4/vec3d/get_entity_pos/main
scoreboard players operation #vx float -= #float4.vec3d.get_entity_pos.x float
scoreboard players operation #vy float -= #float4.vec3d.get_entity_pos.y float
scoreboard players remove #vy float 5000
scoreboard players operation #vz float -= #float4.vec3d.get_entity_pos.z float
scoreboard players operation #vx float *= #neg float
scoreboard players operation #vy float *= #neg float
scoreboard players operation #vz float *= #neg float
function df_lib:float4/vec3d/normalize_vx_vy_vz/main
scoreboard players operation #mx float = #float4.vec3d.normalize.x float
scoreboard players operation #my float = #float4.vec3d.normalize.y float
scoreboard players operation #mz float = #float4.vec3d.normalize.z float
function df_lib:float4/vec3d/modify_motion_mx_my_mz/main
