
entity thisEntity is @s
score getDirectionX is #getDirectionX float
score getDirectionY is #getDirectionY float
score thisEntityPosX is #thisEntityPosX float
score thisEntityPosY is #thisEntityPosY float


thisEntityPosX = thisEntity nbt Pos[0] 10000
thisEntityPosY = thisEntity nbt Pos[2] 10000
$execute at @s rotated ~$(rotX) 0 positioned ^ ^ ^1 summon minecraft:area_effect_cloud :
    getDirectionX = thisEntity nbt Pos[0] 10000
    getDirectionY = thisEntity nbt Pos[2] 10000
    getDirectionX -= thisEntityPosX
    getDirectionY -= thisEntityPosY
    kill @s

op #float4.vec2d.get_entity_direction.x float = #getDirectionX float
op #float4.vec2d.get_entity_direction.y float = #getDirectionY float