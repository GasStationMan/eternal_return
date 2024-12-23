scoreboard players set #tempWidth float 10000
scoreboard players operation #tempWidth float *= #10000 float
scoreboard players operation #tempWidth float /= #2 float
scoreboard players set #tempHeight float 20000
scoreboard players operation #tempHeight float *= #10000 float
scoreboard players operation #tempHeight float /= #2 float
function df_lib:float4/vec3d/get_entity_pos
scoreboard players set @s float4.vec3.width 0
scoreboard players operation @s float4.vec3.width = #tempWidth float
scoreboard players set @s float4.vec3.height 0
scoreboard players operation @s float4.vec3.height = #tempHeight float
scoreboard players set @s float4.vec3.Plane_pX.Nx 10000
scoreboard players set @s float4.vec3.Plane_pX.Ny 0
scoreboard players set @s float4.vec3.Plane_pX.Nz 0
scoreboard players set @s float4.vec3.Plane_pX.Ox 0
scoreboard players set @s float4.vec3.Plane_pX.Oy 0
scoreboard players set @s float4.vec3.Plane_pX.Oz 0
scoreboard players operation @s float4.vec3.Plane_pX.Ox = #float4.vec3d.get_entity_pos.x float
scoreboard players operation @s float4.vec3.Plane_pX.Ox += #tempWidth float
scoreboard players operation @s float4.vec3.Plane_pX.Oy = #float4.vec3d.get_entity_pos.y float
scoreboard players operation @s float4.vec3.Plane_pX.Oy -= #tempHeight float
scoreboard players operation @s float4.vec3.Plane_pX.Oz = #float4.vec3d.get_entity_pos.z float
scoreboard players set @s float4.vec3.Plane_pY.Nx 0
scoreboard players set @s float4.vec3.Plane_pY.Ny 10000
scoreboard players set @s float4.vec3.Plane_pY.Nz 0
scoreboard players set @s float4.vec3.Plane_pY.Ox 0
scoreboard players set @s float4.vec3.Plane_pY.Oy 0
scoreboard players set @s float4.vec3.Plane_pY.Oz 0
scoreboard players operation @s float4.vec3.Plane_pY.Ox = #float4.vec3d.get_entity_pos.x float
scoreboard players operation @s float4.vec3.Plane_pY.Oy = #float4.vec3d.get_entity_pos.y float
scoreboard players operation @s float4.vec3.Plane_pY.Oz = #float4.vec3d.get_entity_pos.z float
scoreboard players set @s float4.vec3.Plane_pZ.Nx 0
scoreboard players set @s float4.vec3.Plane_pZ.Ny 0
scoreboard players set @s float4.vec3.Plane_pZ.Nz 10000
scoreboard players set @s float4.vec3.Plane_pZ.Ox 0
scoreboard players set @s float4.vec3.Plane_pZ.Oy 0
scoreboard players set @s float4.vec3.Plane_pZ.Oz 0
scoreboard players operation @s float4.vec3.Plane_pZ.Ox = #float4.vec3d.get_entity_pos.x float
scoreboard players operation @s float4.vec3.Plane_pZ.Oy = #float4.vec3d.get_entity_pos.y float
scoreboard players operation @s float4.vec3.Plane_pZ.Oy -= #tempHeight float
scoreboard players operation @s float4.vec3.Plane_pZ.Oz = #float4.vec3d.get_entity_pos.z float
scoreboard players operation @s float4.vec3.Plane_pZ.Oz += #tempWidth float
scoreboard players set @s float4.vec3.Plane_nX.Nx -10000
scoreboard players set @s float4.vec3.Plane_nX.Ny 0
scoreboard players set @s float4.vec3.Plane_nX.Nz 0
scoreboard players set @s float4.vec3.Plane_nX.Ox 0
scoreboard players set @s float4.vec3.Plane_nX.Oy 0
scoreboard players set @s float4.vec3.Plane_nX.Oz 0
scoreboard players operation @s float4.vec3.Plane_nX.Ox = #float4.vec3d.get_entity_pos.x float
scoreboard players operation @s float4.vec3.Plane_nX.Ox -= #tempWidth float
scoreboard players operation @s float4.vec3.Plane_nX.Oy = #float4.vec3d.get_entity_pos.y float
scoreboard players operation @s float4.vec3.Plane_nX.Oy -= #tempHeight float
scoreboard players operation @s float4.vec3.Plane_nX.Oz = #float4.vec3d.get_entity_pos.z float
scoreboard players set @s float4.vec3.Plane_nY.Nx 0
scoreboard players set @s float4.vec3.Plane_nY.Ny -10000
scoreboard players set @s float4.vec3.Plane_nY.Nz 0
scoreboard players set @s float4.vec3.Plane_nY.Ox 0
scoreboard players set @s float4.vec3.Plane_nY.Oy 0
scoreboard players set @s float4.vec3.Plane_nY.Oz 0
scoreboard players operation @s float4.vec3.Plane_nY.Ox = #float4.vec3d.get_entity_pos.x float
scoreboard players operation @s float4.vec3.Plane_nY.Oy = #float4.vec3d.get_entity_pos.y float
scoreboard players operation @s float4.vec3.Plane_nY.Oy -= #tempHeight float
scoreboard players operation @s float4.vec3.Plane_nY.Oy -= #tempHeight float
scoreboard players operation @s float4.vec3.Plane_nY.Oz = #float4.vec3d.get_entity_pos.z float
scoreboard players set @s float4.vec3.Plane_nZ.Nx 0
scoreboard players set @s float4.vec3.Plane_nZ.Ny 0
scoreboard players set @s float4.vec3.Plane_nZ.Nz -10000
scoreboard players set @s float4.vec3.Plane_nZ.Ox 0
scoreboard players set @s float4.vec3.Plane_nZ.Oy 0
scoreboard players set @s float4.vec3.Plane_nZ.Oz 0
scoreboard players operation @s float4.vec3.Plane_nZ.Ox = #float4.vec3d.get_entity_pos.x float
scoreboard players operation @s float4.vec3.Plane_nZ.Oy = #float4.vec3d.get_entity_pos.y float
scoreboard players operation @s float4.vec3.Plane_nZ.Oy -= #tempHeight float
scoreboard players operation @s float4.vec3.Plane_nZ.Oz = #float4.vec3d.get_entity_pos.z float
scoreboard players operation @s float4.vec3.Plane_nZ.Oz -= #tempWidth float
tag @s remove new_hitbox
