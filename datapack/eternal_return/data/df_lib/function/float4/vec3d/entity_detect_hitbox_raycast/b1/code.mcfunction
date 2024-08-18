function df_lib:float4/vec3d/get_entity_direction/main {rotX:0, rotY:0}
function df_lib:float4/vec3d/get_entity_pos/main
scoreboard players add #float4.vec3d.get_entity_pos.y float 17000
function df_lib:float4/vec2d/detect_circular_sector/main {halfAngle: 30, distance: 10}
execute as @e[type=minecraft:interaction, tag=float4.vector2d.detect_circular_sector, distance=..10] run function df_lib:float4/vec3d/entity_detect_hitbox_raycast/b1/b1/code
