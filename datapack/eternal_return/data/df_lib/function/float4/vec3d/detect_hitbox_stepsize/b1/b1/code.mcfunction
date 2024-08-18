say [DEBUG] call function df_lib:float4/vec3d/get_entity_pos/main
function df_lib:float4/vec3d/get_projectile_motion/main
scoreboard players operation #float4.vec3d.get_projectile_motion.x float /= #60 float
scoreboard players operation #float4.vec3d.get_projectile_motion.y float /= #60 float
scoreboard players operation #float4.vec3d.get_projectile_motion.z float /= #60 float
function df_lib:float4/vec3d/get_entity_pos/main
scoreboard players operation #distanceX float = #float4.vec3d.get_entity_pos.x float
scoreboard players operation #distanceX float -= #hitBoxPosX float
scoreboard players operation #distanceY float = #float4.vec3d.get_entity_pos.y float
scoreboard players operation #distanceY float -= #hitBoxPosY float
scoreboard players operation #distanceZ float = #float4.vec3d.get_entity_pos.z float
scoreboard players operation #distanceZ float -= #hitBoxPosZ float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b1/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b2/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b3/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b4/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b5/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b6/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b7/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b8/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b9/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b10/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b11/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b12/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b13/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b14/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b15/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b16/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b17/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b18/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b19/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b20/code
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.x float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.y float
scoreboard players operation #distanceX float += #float4.vec3d.get_projectile_motion.z float
execute if score #distanceY float matches -20000..0 if score #distanceX float matches -10000..10000 if score #distanceZ float matches -10000..10000 run return run function df_lib:float4/vec3d/detect_hitbox_stepsize/b1/b1/b21/code
scoreboard players reset #targetPosX float
scoreboard players reset #targetPosY float
scoreboard players reset #targetPosZ float
scoreboard players reset #distanceX float
scoreboard players reset #distanceY float
scoreboard players reset #distanceZ float
