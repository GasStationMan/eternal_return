scoreboard players operation #v1x float = #float4.vec3d.get_entity_direction.x float
scoreboard players operation #v1y float = #float4.vec3d.get_entity_direction.y float
scoreboard players operation #v1z float = #float4.vec3d.get_entity_direction.z float
scoreboard players operation #v2x float = #nx float
scoreboard players operation #v2y float = #ny float
scoreboard players operation #v2z float = #nz float
function df_lib:float4/vec3d/dot_prod_v1x_v1y_v1z_v2x_v2y_v2z/main
scoreboard players operation #scaleToDirDown float = #float4.vec3d.dot_prod float
execute unless score #scaleToDirDown float matches 0 run function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/b1/code
scoreboard players reset #nx float
scoreboard players reset #ny float
scoreboard players reset #nz float
scoreboard players reset #ox float
scoreboard players reset #oy float
scoreboard players reset #oz float
scoreboard players reset #scaleToDirUpper float
scoreboard players reset #scaleToDirDown float
