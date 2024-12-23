#execute as @e[type=minecraft:arrow]

execute as @e[type=#projectile,tag=missile] at @s\
    unless entity @n[tag=target,distance=..20] run return run kill @s


execute as @e[type=#projectile,tag=missile] :
    function df_lib:float4/vec3d/get_entity_pos/main
    op #vx float = #float4.vec3d.get_entity_pos.x float
    op #vy float = #float4.vec3d.get_entity_pos.y float
    op #vz float = #float4.vec3d.get_entity_pos.z float

    execute as @n[tag=target] run function df_lib:float4/vec3d/get_entity_pos/main
    op #vx float -= #float4.vec3d.get_entity_pos.x float
    op #vy float -= #float4.vec3d.get_entity_pos.y float
    sub #vy float 5000
    op #vz float -= #float4.vec3d.get_entity_pos.z float
    op #vx float *= #neg float
    op #vy float *= #neg float
    op #vz float *= #neg float
    function df_lib:float4/vec3d/normalize_vx_vy_vz/main
    op #mx float = #float4.vec3d.normalize.x float
    op #my float = #float4.vec3d.normalize.y float
    op #mz float = #float4.vec3d.normalize.z float
    function df_lib:float4/vec3d/modify_motion_mx_my_mz/main
    #say [DEBUG] modified arrow motion




    
