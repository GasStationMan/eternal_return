
entity thisEntity is @s
score returnX is #float4.vec3d.get_projectile_motion.x float
score returnY is #float4.vec3d.get_projectile_motion.y float
score returnZ is #float4.vec3d.get_projectile_motion.z float
returnX = thisEntity nbt Motion[0] 10000
returnY = thisEntity nbt Motion[1] 10000
returnZ = thisEntity nbt Motion[2] 10000