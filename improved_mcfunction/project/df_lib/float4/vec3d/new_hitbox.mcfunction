$summon interaction ~ ~ ~ {width:$(width),height:-$(height),Tags:["new_hitbox","df_lib_hitbox",$(tag)]}

execute store result score #tempWidth float run data get entity @e[tag=new_hitbox,limit=1] width 5000
execute store result score #tempHeight float run data get entity @e[tag=new_hitbox,limit=1] height -5000

execute as @e[type=minecraft:interaction,tag=new_hitbox,limit=1]:
    function df_lib:float4/vec3d/get_entity_pos/main
    
    set @s float4.vec3.width 0
    op @s float4.vec3.width = #tempWidth float
    set @s float4.vec3.height 0
    op @s float4.vec3.height = #tempHeight float

    #=========================================================# +X
    set @s float4.vec3.Plane_pX.Nx 10000
    set @s float4.vec3.Plane_pX.Ny 0
    set @s float4.vec3.Plane_pX.Nz 0

    set @s float4.vec3.Plane_pX.Ox 0
    set @s float4.vec3.Plane_pX.Oy 0
    set @s float4.vec3.Plane_pX.Oz 0

    op @s float4.vec3.Plane_pX.Ox = #float4.vec3d.get_entity_pos.x float
    op @s float4.vec3.Plane_pX.Ox += #tempWidth float

    op @s float4.vec3.Plane_pX.Oy = #float4.vec3d.get_entity_pos.y float
    op @s float4.vec3.Plane_pX.Oy -= #tempHeight float

    op @s float4.vec3.Plane_pX.Oz = #float4.vec3d.get_entity_pos.z float

    #=========================================================# +Y
    set @s float4.vec3.Plane_pY.Nx 0
    set @s float4.vec3.Plane_pY.Ny 10000
    set @s float4.vec3.Plane_pY.Nz 0

    set @s float4.vec3.Plane_pY.Ox 0
    set @s float4.vec3.Plane_pY.Oy 0
    set @s float4.vec3.Plane_pY.Oz 0

    op @s float4.vec3.Plane_pY.Ox = #float4.vec3d.get_entity_pos.x float
    op @s float4.vec3.Plane_pY.Oy = #float4.vec3d.get_entity_pos.y float
    op @s float4.vec3.Plane_pY.Oz = #float4.vec3d.get_entity_pos.z float

    #=========================================================# +Z
    set @s float4.vec3.Plane_pZ.Nx 0
    set @s float4.vec3.Plane_pZ.Ny 0
    set @s float4.vec3.Plane_pZ.Nz 10000
    
    set @s float4.vec3.Plane_pZ.Ox 0
    set @s float4.vec3.Plane_pZ.Oy 0
    set @s float4.vec3.Plane_pZ.Oz 0

    op @s float4.vec3.Plane_pZ.Ox = #float4.vec3d.get_entity_pos.x float

    op @s float4.vec3.Plane_pZ.Oy = #float4.vec3d.get_entity_pos.y float
    op @s float4.vec3.Plane_pZ.Oy -= #tempHeight float

    op @s float4.vec3.Plane_pZ.Oz = #float4.vec3d.get_entity_pos.z float
    op @s float4.vec3.Plane_pZ.Oz += #tempWidth float

    #=========================================================# -X
    set @s float4.vec3.Plane_nX.Nx -10000
    set @s float4.vec3.Plane_nX.Ny 0
    set @s float4.vec3.Plane_nX.Nz 0

    set @s float4.vec3.Plane_nX.Ox 0
    set @s float4.vec3.Plane_nX.Oy 0
    set @s float4.vec3.Plane_nX.Oz 0

    op @s float4.vec3.Plane_nX.Ox = #float4.vec3d.get_entity_pos.x float
    op @s float4.vec3.Plane_nX.Ox -= #tempWidth float

    op @s float4.vec3.Plane_nX.Oy = #float4.vec3d.get_entity_pos.y float
    op @s float4.vec3.Plane_nX.Oy -= #tempHeight float

    op @s float4.vec3.Plane_nX.Oz = #float4.vec3d.get_entity_pos.z float

    #=========================================================# -Y
    set @s float4.vec3.Plane_nY.Nx 0
    set @s float4.vec3.Plane_nY.Ny -10000
    set @s float4.vec3.Plane_nY.Nz 0

    set @s float4.vec3.Plane_nY.Ox 0
    set @s float4.vec3.Plane_nY.Oy 0
    set @s float4.vec3.Plane_nY.Oz 0

    op @s float4.vec3.Plane_nY.Ox = #float4.vec3d.get_entity_pos.x float

    op @s float4.vec3.Plane_nY.Oy = #float4.vec3d.get_entity_pos.y float
    op @s float4.vec3.Plane_nY.Oy -= #tempHeight float
    op @s float4.vec3.Plane_nY.Oy -= #tempHeight float

    op @s float4.vec3.Plane_nY.Oz = #float4.vec3d.get_entity_pos.z float

    #=========================================================# -Z
    set @s float4.vec3.Plane_nZ.Nx 0
    set @s float4.vec3.Plane_nZ.Ny 0
    set @s float4.vec3.Plane_nZ.Nz -10000

    set @s float4.vec3.Plane_nZ.Ox 0
    set @s float4.vec3.Plane_nZ.Oy 0
    set @s float4.vec3.Plane_nZ.Oz 0

    op @s float4.vec3.Plane_nZ.Ox = #float4.vec3d.get_entity_pos.x float

    op @s float4.vec3.Plane_nZ.Oy = #float4.vec3d.get_entity_pos.y float
    op @s float4.vec3.Plane_nZ.Oy -= #tempHeight float

    op @s float4.vec3.Plane_nZ.Oz = #float4.vec3d.get_entity_pos.z float
    op @s float4.vec3.Plane_nZ.Oz -= #tempWidth float

    tag @s -= new_hitbox

reset #tempWidth float
reset #tempHeight float
