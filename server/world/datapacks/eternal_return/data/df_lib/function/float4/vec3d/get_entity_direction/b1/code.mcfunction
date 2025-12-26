execute store result score #getDirectionX float run data get entity @s Pos[0] 10000
execute store result score #getDirectionY float run data get entity @s Pos[1] 10000
execute store result score #getDirectionZ float run data get entity @s Pos[2] 10000
scoreboard players operation #getDirectionX float -= #float4.vec3d.get_entity_direction.x float
scoreboard players operation #getDirectionY float -= #float4.vec3d.get_entity_direction.y float
scoreboard players operation #getDirectionZ float -= #float4.vec3d.get_entity_direction.z float
kill @s
