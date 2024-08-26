execute store result score #thisEntityPosX float run data get entity @s Pos[0] 10000
execute store result score #thisEntityPosY float run data get entity @s Pos[2] 10000
$execute at @s rotated ~$(rotX) 0 positioned ^ ^ ^1 summon minecraft:area_effect_cloud run function df_lib:float4/vec2d/get_entity_direction/b1/code
scoreboard players operation #float4.vec2d.get_entity_direction.x float = #getDirectionX float
scoreboard players operation #float4.vec2d.get_entity_direction.y float = #getDirectionY float
