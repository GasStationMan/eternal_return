tag @s add executer
function df_lib:float4/vec2d/get_entity_pos/main
scoreboard players operation #playerPosX float = #float4.vec2d.get_entity_pos.x float
scoreboard players operation #playerPosY float = #float4.vec2d.get_entity_pos.y float
$function df_lib:float4/vec2d/get_entity_direction/main {rotX : -$(halfAngle)}
scoreboard players operation #playerDirX_1 float = #float4.vec2d.get_entity_direction.x float
scoreboard players operation #playerDirY_1 float = #float4.vec2d.get_entity_direction.y float
$function df_lib:float4/vec2d/get_entity_direction/main {rotX : $(halfAngle)}
scoreboard players operation #playerDirX_2 float = #float4.vec2d.get_entity_direction.x float
scoreboard players operation #playerDirY_2 float = #float4.vec2d.get_entity_direction.y float
$execute at @s if entity @e[type=!minecraft:area_effect_cloud, tag=!executer, distance= ..$(distance)] as @e[type=!minecraft:area_effect_cloud, tag=!executer, distance= ..5] run function df_lib:float4/vec2d/detect_circular_sector/b1/code
scoreboard players reset #playerPosX float
scoreboard players reset #playerPosY float
scoreboard players reset #playerDirX_1 float
scoreboard players reset #playerDirY_1 float
tag @s remove executer
