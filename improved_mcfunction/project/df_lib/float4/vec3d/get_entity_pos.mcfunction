
entity thisEntity is @s
score returnX is #float4.vec3d.get_entity_pos.x float
score returnY is #float4.vec3d.get_entity_pos.y float
score returnZ is #float4.vec3d.get_entity_pos.z float
returnX = thisEntity nbt Pos[0] 10000
returnY = thisEntity nbt Pos[1] 10000
returnZ = thisEntity nbt Pos[2] 10000