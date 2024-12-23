


tag @s += executer
function df_lib:float4/vec2d/get_entity_pos/main
op #playerPosX float = #float4.vec2d.get_entity_pos.x float
op #playerPosY float = #float4.vec2d.get_entity_pos.y float

$function df_lib:float4/vec2d/get_entity_direction/main {rotX : -$(halfAngle)}
op #playerDirX_1 float = #float4.vec2d.get_entity_direction.x float
op #playerDirY_1 float = #float4.vec2d.get_entity_direction.y float

$function df_lib:float4/vec2d/get_entity_direction/main {rotX : $(halfAngle)}
op #playerDirX_2 float = #float4.vec2d.get_entity_direction.x float
op #playerDirY_2 float = #float4.vec2d.get_entity_direction.y float

$execute at @s if entity @e[type=!minecraft:area_effect_cloud, distance= ..$(distance)] as @e[type=!minecraft:area_effect_cloud, tag=!executer, distance= ..$(distance)] :
    function df_lib:float4/vec2d/get_entity_pos/main
    op #distanceX float = #float4.vec2d.get_entity_pos.x float
    op #distanceX float -= #playerPosX float
    op #distanceY float = #float4.vec2d.get_entity_pos.y float
    op #distanceY float -= #playerPosY float
    
    op #v1x float = #playerDirX_1 float
    op #v1y float = #playerDirY_1 float
    op #v2x float = #distanceX float
    op #v2y float = #distanceY float
    function df_lib:float4/vec2d/cross_prod_v1x_v1y_v2x_v2y/main
    if score #float4.vec2d.cross_prod float == ..0 run return 0
    
    op #v1x float = #distanceX float
    op #v1y float = #distanceY float
    op #v2x float = #playerDirX_2 float
    op #v2y float = #playerDirY_2 float
    function df_lib:float4/vec2d/cross_prod_v1x_v1y_v2x_v2y/main
    if score #float4.vec2d.cross_prod float == ..0 run return 0
    
    tag @s += float4.vector2d.detect_circular_sector
reset #distanceX float
reset #distanceY float
reset #playerPosX float
reset #playerPosY float
reset #playerDirX_1 float
reset #playerDirY_1 float
tag @s -= executer

