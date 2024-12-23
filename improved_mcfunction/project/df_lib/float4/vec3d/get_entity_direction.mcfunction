
entity thisEntity is @s
score getDirectionX is #getDirectionX float
score getDirectionY is #getDirectionY float
score getDirectionZ is #getDirectionZ float
score thisEntityPosX is #float4.vec3d.get_entity_direction.x float
score thisEntityPosY is #float4.vec3d.get_entity_direction.y float
score thisEntityPosZ is #float4.vec3d.get_entity_direction.z float


thisEntityPosX = thisEntity nbt Pos[0] 10000
thisEntityPosY = thisEntity nbt Pos[1] 10000
thisEntityPosZ = thisEntity nbt Pos[2] 10000
$execute at @s rotated ~$(rotX) ~$(rotY) positioned ^ ^ ^1 summon minecraft:area_effect_cloud :
    getDirectionX = thisEntity nbt Pos[0] 10000
    getDirectionY = thisEntity nbt Pos[1] 10000
    getDirectionZ = thisEntity nbt Pos[2] 10000
    getDirectionX -= thisEntityPosX
    getDirectionY -= thisEntityPosY
    getDirectionZ -= thisEntityPosZ
    kill @s

op #float4.vec3d.get_entity_direction.x float = #getDirectionX float
op #float4.vec3d.get_entity_direction.y float = #getDirectionY float
op #float4.vec3d.get_entity_direction.z float = #getDirectionZ float

reset #getDirectionX float
reset #getDirectionY float
reset #getDirectionZ float
#reset #thisEntityPosX float
#reset #thisEntityPosY float
#reset #thisEntityPosZ float