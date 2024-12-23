


execute if entity @s[type=minecraft:interaction] at @s if entity @e[type=minecraft:arrow,distance=..2] :
    function df_lib:float4/vec3d/get_entity_pos/main
    op #hitBoxPosX float = #float4.vec3d.get_entity_pos.x float
    op #hitBoxPosY float = #float4.vec3d.get_entity_pos.y float
    op #hitBoxPosZ float = #float4.vec3d.get_entity_pos.z float

    execute as @e[type=minecraft:arrow,distance=..2] :
        say [DEBUG] call function df_lib:float4/vec3d/get_entity_pos/main
        function df_lib:float4/vec3d/get_projectile_motion/main
        op #float4.vec3d.get_projectile_motion.x float /= #60 float
        op #float4.vec3d.get_projectile_motion.y float /= #60 float
        op #float4.vec3d.get_projectile_motion.z float /= #60 float
        
        function df_lib:float4/vec3d/get_entity_pos/main
        op #distanceX float = #float4.vec3d.get_entity_pos.x float
        op #distanceX float -= #hitBoxPosX float

        op #distanceY float = #float4.vec3d.get_entity_pos.y float
        op #distanceY float -= #hitBoxPosY float

        op #distanceZ float = #float4.vec3d.get_entity_pos.z float
        op #distanceZ float -= #hitBoxPosZ float

        #say [DEBUG] comparing...
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED

        #step_size로 비교

        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED
        
        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED
        
        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED
        
        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED
        
        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED

        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED

        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED

        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED

        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED
        
        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED
        
        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED
        
        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED
        
        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED
        
        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED
        
        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED

        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED

        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED

        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED

        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED
        
        op #distanceX float += #float4.vec3d.get_projectile_motion.x float
        op #distanceX float += #float4.vec3d.get_projectile_motion.y float
        op #distanceX float += #float4.vec3d.get_projectile_motion.z float
        if score #distanceY float == -20000..0 if score #distanceX float == -10000..10000 if score #distanceZ float == -10000..10000 run goto :
            tag @s += float4.vector3d.detect_hitbox
            kill @s
            say @s DETECTED


        reset #targetPosX float
        reset #targetPosY float
        reset #targetPosZ float
        reset #distanceX float
        reset #distanceY float
        reset #distanceZ float

    reset #hitBoxPosX float
    reset #hitBoxPosY float
    reset #hitBoxPosZ float



