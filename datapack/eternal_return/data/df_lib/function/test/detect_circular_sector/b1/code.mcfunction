function df_lib:float4/vec2d/get_entity_pos/main
scoreboard players operation #targetPosX float = #float4.vec2d.get_entity_pos.x float
scoreboard players operation #targetPosY float = #float4.vec2d.get_entity_pos.y float
scoreboard players operation #distanceX float = #targetPosX float
scoreboard players operation #distanceX float -= #playerPosX float
scoreboard players operation #distanceY float = #targetPosY float
scoreboard players operation #distanceY float -= #playerPosY float
scoreboard players operation #v1x float = #playerDirX_1 float
scoreboard players operation #v1y float = #playerDirY_1 float
scoreboard players operation #v2x float = #distanceX float
scoreboard players operation #v2y float = #distanceY float
function df_lib:float4/vec2d/cross_prod_v1x_v1y_v2x_v2y/main
execute if score #float4.vec2d.cross_prod float matches ..0 run return 0
scoreboard players operation #v1x float = #distanceX float
scoreboard players operation #v1y float = #distanceY float
scoreboard players operation #v2x float = #playerDirX_2 float
scoreboard players operation #v2y float = #playerDirY_2 float
function df_lib:float4/vec2d/cross_prod_v1x_v1y_v2x_v2y/main
execute if score #float4.vec2d.cross_prod float matches ..0 run return 0
tag @s add detected
scoreboard players reset #targetPosX float
scoreboard players reset #targetPosY float
scoreboard players reset #distanceX float
scoreboard players reset #distanceY float
