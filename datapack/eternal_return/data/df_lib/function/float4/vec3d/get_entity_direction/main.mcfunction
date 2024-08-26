execute store result score #float4.vec3d.get_entity_direction.x float run data get entity @s Pos[0] 10000
execute store result score #float4.vec3d.get_entity_direction.y float run data get entity @s Pos[1] 10000
execute store result score #float4.vec3d.get_entity_direction.z float run data get entity @s Pos[2] 10000
$execute at @s rotated ~$(rotX) ~$(rotY) positioned ^ ^ ^1 summon minecraft:area_effect_cloud run function df_lib:float4/vec3d/get_entity_direction/b1/code
scoreboard players operation #float4.vec3d.get_entity_direction.x float = #getDirectionX float
scoreboard players operation #float4.vec3d.get_entity_direction.y float = #getDirectionY float
scoreboard players operation #float4.vec3d.get_entity_direction.z float = #getDirectionZ float
scoreboard players reset #getDirectionX float
scoreboard players reset #getDirectionY float
scoreboard players reset #getDirectionZ float
