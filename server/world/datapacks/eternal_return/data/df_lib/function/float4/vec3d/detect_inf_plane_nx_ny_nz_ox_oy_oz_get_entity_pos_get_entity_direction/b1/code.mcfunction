scoreboard players operation #v1x float = #ox float
scoreboard players operation #v1x float -= #float4.vec3d.get_entity_pos.x float
scoreboard players operation #v1y float = #oy float
scoreboard players operation #v1y float -= #float4.vec3d.get_entity_pos.y float
scoreboard players operation #v1z float = #oz float
scoreboard players operation #v1z float -= #float4.vec3d.get_entity_pos.z float
scoreboard players operation #v2x float = #nx float
scoreboard players operation #v2y float = #ny float
scoreboard players operation #v2z float = #nz float
function df_lib:float4/vec3d/dot_prod_v1x_v1y_v1z_v2x_v2y_v2z/main
scoreboard players operation #x float = #float4.vec3d.dot_prod float
execute if score #x float matches 0.. if score #y float matches ..-1 run return run scoreboard players set #float4.vec3d.detect_inf_plane float -1
execute if score #x float matches ..-1 if score #y float matches 0.. run return run scoreboard players set #float4.vec3d.detect_inf_plane float -1
scoreboard players operation #x float *= #100 float
scoreboard players operation #x float /= #y float
scoreboard players operation #float4.vec3d.detect_inf_plane.x float = #float4.vec3d.get_entity_direction.x float
scoreboard players operation #float4.vec3d.detect_inf_plane.x float /= #100 float
scoreboard players operation #float4.vec3d.detect_inf_plane.x float *= #x float
scoreboard players operation #float4.vec3d.detect_inf_plane.x float += #float4.vec3d.get_entity_pos.x float
scoreboard players operation #float4.vec3d.detect_inf_plane.y float = #float4.vec3d.get_entity_direction.y float
scoreboard players operation #float4.vec3d.detect_inf_plane.y float /= #100 float
scoreboard players operation #float4.vec3d.detect_inf_plane.y float *= #x float
scoreboard players operation #float4.vec3d.detect_inf_plane.y float += #float4.vec3d.get_entity_pos.y float
scoreboard players operation #float4.vec3d.detect_inf_plane.z float = #float4.vec3d.get_entity_direction.z float
scoreboard players operation #float4.vec3d.detect_inf_plane.z float /= #100 float
scoreboard players operation #float4.vec3d.detect_inf_plane.z float *= #x float
scoreboard players operation #float4.vec3d.detect_inf_plane.z float += #float4.vec3d.get_entity_pos.z float
scoreboard players set #float4.vec3d.detect_inf_plane float 1
