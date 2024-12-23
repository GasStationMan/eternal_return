
entity thisEntity is @s
score returnX is #float4.vec2d.get_entity_pos.x float
score returnY is #float4.vec2d.get_entity_pos.y float
returnX = thisEntity nbt Pos[0] 10000
returnY = thisEntity nbt Pos[2] 10000