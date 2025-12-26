function df_lib:float4/vec3d/update_hitbox/main
scoreboard players operation #max_X float = @s float4.vec3.Plane_pX.Ox
scoreboard players add #max_X float 1000
scoreboard players operation #max_Y float = @s float4.vec3.Plane_pY.Oy
scoreboard players add #max_Y float 1000
scoreboard players operation #max_Z float = @s float4.vec3.Plane_pZ.Oz
scoreboard players add #max_Z float 1000
scoreboard players operation #min_X float = @s float4.vec3.Plane_nX.Ox
scoreboard players remove #min_X float 1000
scoreboard players operation #min_Y float = @s float4.vec3.Plane_nY.Oy
scoreboard players remove #min_Y float 1000
scoreboard players operation #min_Z float = @s float4.vec3.Plane_nZ.Oz
scoreboard players remove #min_Z float 1000
scoreboard players operation #nx float = @s float4.vec3.Plane_pX.Nx
scoreboard players operation #ny float = @s float4.vec3.Plane_pX.Ny
scoreboard players operation #nz float = @s float4.vec3.Plane_pX.Nz
scoreboard players operation #ox float = @s float4.vec3.Plane_pX.Ox
scoreboard players operation #oy float = @s float4.vec3.Plane_pX.Oy
scoreboard players operation #oz float = @s float4.vec3.Plane_pX.Oz
function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main
execute if score #df_lib.debug df_debug matches 1 run function df_lib:float4/vec3d/entity_detect_hitbox_raycast/b1/b1/b1/code
execute if score #float4.vec3d.detect_inf_plane float matches 1 if score #min_X float <= #float4.vec3d.detect_inf_plane.x float if score #float4.vec3d.detect_inf_plane.x float <= #max_X float if score #min_Y float <= #float4.vec3d.detect_inf_plane.y float if score #float4.vec3d.detect_inf_plane.y float <= #max_Y float if score #min_Z float <= #float4.vec3d.detect_inf_plane.z float if score #float4.vec3d.detect_inf_plane.z float <= #max_Z float run return run function df_lib:float4/vec3d/entity_detect_hitbox_raycast/b1/b1/b2/code
scoreboard players operation #nx float = @s float4.vec3.Plane_pY.Nx
scoreboard players operation #ny float = @s float4.vec3.Plane_pY.Ny
scoreboard players operation #nz float = @s float4.vec3.Plane_pY.Nz
scoreboard players operation #ox float = @s float4.vec3.Plane_pY.Ox
scoreboard players operation #oy float = @s float4.vec3.Plane_pY.Oy
scoreboard players operation #oz float = @s float4.vec3.Plane_pY.Oz
function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main
execute if score #df_lib.debug df_debug matches 1 run function df_lib:float4/vec3d/entity_detect_hitbox_raycast/b1/b1/b3/code
execute if score #float4.vec3d.detect_inf_plane float matches 1 if score #min_X float <= #float4.vec3d.detect_inf_plane.x float if score #float4.vec3d.detect_inf_plane.x float <= #max_X float if score #min_Y float <= #float4.vec3d.detect_inf_plane.y float if score #float4.vec3d.detect_inf_plane.y float <= #max_Y float if score #min_Z float <= #float4.vec3d.detect_inf_plane.z float if score #float4.vec3d.detect_inf_plane.z float <= #max_Z float run return run function df_lib:float4/vec3d/entity_detect_hitbox_raycast/b1/b1/b4/code
scoreboard players operation #nx float = @s float4.vec3.Plane_pZ.Nx
scoreboard players operation #ny float = @s float4.vec3.Plane_pZ.Ny
scoreboard players operation #nz float = @s float4.vec3.Plane_pZ.Nz
scoreboard players operation #ox float = @s float4.vec3.Plane_pZ.Ox
scoreboard players operation #oy float = @s float4.vec3.Plane_pZ.Oy
scoreboard players operation #oz float = @s float4.vec3.Plane_pZ.Oz
function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main
execute if score #df_lib.debug df_debug matches 1 run function df_lib:float4/vec3d/entity_detect_hitbox_raycast/b1/b1/b5/code
execute if score #float4.vec3d.detect_inf_plane float matches 1 if score #min_X float <= #float4.vec3d.detect_inf_plane.x float if score #float4.vec3d.detect_inf_plane.x float <= #max_X float if score #min_Y float <= #float4.vec3d.detect_inf_plane.y float if score #float4.vec3d.detect_inf_plane.y float <= #max_Y float if score #min_Z float <= #float4.vec3d.detect_inf_plane.z float if score #float4.vec3d.detect_inf_plane.z float <= #max_Z float run return run function df_lib:float4/vec3d/entity_detect_hitbox_raycast/b1/b1/b6/code
scoreboard players operation #nx float = @s float4.vec3.Plane_nX.Nx
scoreboard players operation #ny float = @s float4.vec3.Plane_nX.Ny
scoreboard players operation #nz float = @s float4.vec3.Plane_nX.Nz
scoreboard players operation #ox float = @s float4.vec3.Plane_nX.Ox
scoreboard players operation #oy float = @s float4.vec3.Plane_nX.Oy
scoreboard players operation #oz float = @s float4.vec3.Plane_nX.Oz
function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main
execute if score #df_lib.debug df_debug matches 1 run function df_lib:float4/vec3d/entity_detect_hitbox_raycast/b1/b1/b7/code
execute if score #float4.vec3d.detect_inf_plane float matches 1 if score #min_X float <= #float4.vec3d.detect_inf_plane.x float if score #float4.vec3d.detect_inf_plane.x float <= #max_X float if score #min_Y float <= #float4.vec3d.detect_inf_plane.y float if score #float4.vec3d.detect_inf_plane.y float <= #max_Y float if score #min_Z float <= #float4.vec3d.detect_inf_plane.z float if score #float4.vec3d.detect_inf_plane.z float <= #max_Z float run return run function df_lib:float4/vec3d/entity_detect_hitbox_raycast/b1/b1/b8/code
scoreboard players operation #nx float = @s float4.vec3.Plane_nY.Nx
scoreboard players operation #ny float = @s float4.vec3.Plane_nY.Ny
scoreboard players operation #nz float = @s float4.vec3.Plane_nY.Nz
scoreboard players operation #ox float = @s float4.vec3.Plane_nY.Ox
scoreboard players operation #oy float = @s float4.vec3.Plane_nY.Oy
scoreboard players operation #oz float = @s float4.vec3.Plane_nY.Oz
function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main
execute if score #df_lib.debug df_debug matches 1 run function df_lib:float4/vec3d/entity_detect_hitbox_raycast/b1/b1/b9/code
execute if score #float4.vec3d.detect_inf_plane float matches 1 if score #min_X float <= #float4.vec3d.detect_inf_plane.x float if score #float4.vec3d.detect_inf_plane.x float <= #max_X float if score #min_Y float <= #float4.vec3d.detect_inf_plane.y float if score #float4.vec3d.detect_inf_plane.y float <= #max_Y float if score #min_Z float <= #float4.vec3d.detect_inf_plane.z float if score #float4.vec3d.detect_inf_plane.z float <= #max_Z float run return run function df_lib:float4/vec3d/entity_detect_hitbox_raycast/b1/b1/b10/code
scoreboard players operation #nx float = @s float4.vec3.Plane_nZ.Nx
scoreboard players operation #ny float = @s float4.vec3.Plane_nZ.Ny
scoreboard players operation #nz float = @s float4.vec3.Plane_nZ.Nz
scoreboard players operation #ox float = @s float4.vec3.Plane_nZ.Ox
scoreboard players operation #oy float = @s float4.vec3.Plane_nZ.Oy
scoreboard players operation #oz float = @s float4.vec3.Plane_nZ.Oz
function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main
execute if score #df_lib.debug df_debug matches 1 run function df_lib:float4/vec3d/entity_detect_hitbox_raycast/b1/b1/b11/code
execute if score #float4.vec3d.detect_inf_plane float matches 1 if score #min_X float <= #float4.vec3d.detect_inf_plane.x float if score #float4.vec3d.detect_inf_plane.x float <= #max_X float if score #min_Y float <= #float4.vec3d.detect_inf_plane.y float if score #float4.vec3d.detect_inf_plane.y float <= #max_Y float if score #min_Z float <= #float4.vec3d.detect_inf_plane.z float if score #float4.vec3d.detect_inf_plane.z float <= #max_Z float run return run function df_lib:float4/vec3d/entity_detect_hitbox_raycast/b1/b1/b12/code
title @a actionbar [{"text":"[DEBUG] Not found"}]
execute if score #df_lib.debug df_debug matches 1 run function df_lib:float4/vec3d/entity_detect_hitbox_raycast/b1/b1/b13/code
