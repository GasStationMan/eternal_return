


#function df_lib:float4/vec2d/detect_circular_sector/main {halfAngle: 30, distance: 10}
execute at @s if entity @e[type=#hitbox,tag=df_lib_hitbox,distance=1..10] :
    function df_lib:float4/vec3d/get_entity_direction/main {rotX:0, rotY:0}
    function df_lib:float4/vec3d/get_entity_pos/main
    add #float4.vec3d.get_entity_pos.y float 17000

    execute as @e[type=#hitbox,tag=df_lib_hitbox,distance=1..10] :
        #tag @s -= float4.vector2d.detect_circular_sector
        function df_lib:float4/vec3d/update_hitbox/main
        #max X,Y,Z min X,Y,Z
        op #max_X float = @s float4.vec3.Plane_pX.Ox
        add #max_X float 1000
        op #max_Y float = @s float4.vec3.Plane_pY.Oy
        add #max_Y float 1000
        op #max_Z float = @s float4.vec3.Plane_pZ.Oz
        add #max_Z float 1000
        
        op #min_X float = @s float4.vec3.Plane_nX.Ox
        sub #min_X float 1000
        op #min_Y float = @s float4.vec3.Plane_nY.Oy
        sub #min_Y float 1000
        op #min_Z float = @s float4.vec3.Plane_nZ.Oz
        sub #min_Z float 1000
        #say [DEBUG] call function df_lib:float4/vec3d/get_entity_pos/main
        #   PLANE +X -> 
        op #nx float = @s float4.vec3.Plane_pX.Nx
        op #ny float = @s float4.vec3.Plane_pX.Ny
        op #nz float = @s float4.vec3.Plane_pX.Nz
        op #ox float = @s float4.vec3.Plane_pX.Ox
        op #oy float = @s float4.vec3.Plane_pX.Oy
        op #oz float = @s float4.vec3.Plane_pX.Oz
        function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main

        if score #df_lib.debug df_debug == 1 :
            op maxX df_debug = #max_X float
            op maxY df_debug = #max_Y float
            op maxZ df_debug = #max_Z float
            op minX df_debug = #min_X float
            op minY df_debug = #min_Y float
            op minZ df_debug = #min_Z float
            op x df_debug = #float4.vec3d.detect_inf_plane.x float
            op y df_debug = #float4.vec3d.detect_inf_plane.y float
            op z df_debug = #float4.vec3d.detect_inf_plane.z float
        
        if score #float4.vec3d.detect_inf_plane float == 1\
        if score #min_X float <= #float4.vec3d.detect_inf_plane.x float \
        if score #float4.vec3d.detect_inf_plane.x float <= #max_X float \
        if score #min_Y float <= #float4.vec3d.detect_inf_plane.y float \
        if score #float4.vec3d.detect_inf_plane.y float <= #max_Y float \
        if score #min_Z float <= #float4.vec3d.detect_inf_plane.z float \
        if score #float4.vec3d.detect_inf_plane.z float <= #max_Z float run goto :
            tag @s += float4.vec3d.entity_detect_hitbox_raycast
            title @a actionbar [{"text":"[DEBUG] detected"}]
        
        #   PLANE +Y -> 
        op #nx float = @s float4.vec3.Plane_pY.Nx
        op #ny float = @s float4.vec3.Plane_pY.Ny
        op #nz float = @s float4.vec3.Plane_pY.Nz
        op #ox float = @s float4.vec3.Plane_pY.Ox
        op #oy float = @s float4.vec3.Plane_pY.Oy
        op #oz float = @s float4.vec3.Plane_pY.Oz
        function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main

        if score #df_lib.debug df_debug == 1 :
            op maxX df_debug = #max_X float
            op maxY df_debug = #max_Y float
            op maxZ df_debug = #max_Z float
            op minX df_debug = #min_X float
            op minY df_debug = #min_Y float
            op minZ df_debug = #min_Z float
            op x df_debug = #float4.vec3d.detect_inf_plane.x float
            op y df_debug = #float4.vec3d.detect_inf_plane.y float
            op z df_debug = #float4.vec3d.detect_inf_plane.z float

        if score #float4.vec3d.detect_inf_plane float == 1\
        if score #min_X float <= #float4.vec3d.detect_inf_plane.x float \
        if score #float4.vec3d.detect_inf_plane.x float <= #max_X float \
        if score #min_Y float <= #float4.vec3d.detect_inf_plane.y float \
        if score #float4.vec3d.detect_inf_plane.y float <= #max_Y float \
        if score #min_Z float <= #float4.vec3d.detect_inf_plane.z float \
        if score #float4.vec3d.detect_inf_plane.z float <= #max_Z float run goto :
            tag @s += float4.vec3d.entity_detect_hitbox_raycast
            title @a actionbar [{"text":"[DEBUG] detected"}]
        #   PLANE +Z -> 
        op #nx float = @s float4.vec3.Plane_pZ.Nx
        op #ny float = @s float4.vec3.Plane_pZ.Ny
        op #nz float = @s float4.vec3.Plane_pZ.Nz
        op #ox float = @s float4.vec3.Plane_pZ.Ox
        op #oy float = @s float4.vec3.Plane_pZ.Oy
        op #oz float = @s float4.vec3.Plane_pZ.Oz
        function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main

        if score #df_lib.debug df_debug == 1 :
            op maxX df_debug = #max_X float
            op maxY df_debug = #max_Y float
            op maxZ df_debug = #max_Z float
            op minX df_debug = #min_X float
            op minY df_debug = #min_Y float
            op minZ df_debug = #min_Z float
            op x df_debug = #float4.vec3d.detect_inf_plane.x float
            op y df_debug = #float4.vec3d.detect_inf_plane.y float
            op z df_debug = #float4.vec3d.detect_inf_plane.z float
        
        if score #float4.vec3d.detect_inf_plane float == 1\
        if score #min_X float <= #float4.vec3d.detect_inf_plane.x float \
        if score #float4.vec3d.detect_inf_plane.x float <= #max_X float \
        if score #min_Y float <= #float4.vec3d.detect_inf_plane.y float \
        if score #float4.vec3d.detect_inf_plane.y float <= #max_Y float \
        if score #min_Z float <= #float4.vec3d.detect_inf_plane.z float \
        if score #float4.vec3d.detect_inf_plane.z float <= #max_Z float run goto :
            tag @s += float4.vec3d.entity_detect_hitbox_raycast
            title @a actionbar [{"text":"[DEBUG] detected"}]
        #   PLANE -X -> 
        op #nx float = @s float4.vec3.Plane_nX.Nx
        op #ny float = @s float4.vec3.Plane_nX.Ny
        op #nz float = @s float4.vec3.Plane_nX.Nz
        op #ox float = @s float4.vec3.Plane_nX.Ox
        op #oy float = @s float4.vec3.Plane_nX.Oy
        op #oz float = @s float4.vec3.Plane_nX.Oz
        function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main

        if score #df_lib.debug df_debug == 1 :
            op maxX df_debug = #max_X float
            op maxY df_debug = #max_Y float
            op maxZ df_debug = #max_Z float
            op minX df_debug = #min_X float
            op minY df_debug = #min_Y float
            op minZ df_debug = #min_Z float
            op x df_debug = #float4.vec3d.detect_inf_plane.x float
            op y df_debug = #float4.vec3d.detect_inf_plane.y float
            op z df_debug = #float4.vec3d.detect_inf_plane.z float

        if score #float4.vec3d.detect_inf_plane float == 1\
        if score #min_X float <= #float4.vec3d.detect_inf_plane.x float \
        if score #float4.vec3d.detect_inf_plane.x float <= #max_X float \
        if score #min_Y float <= #float4.vec3d.detect_inf_plane.y float \
        if score #float4.vec3d.detect_inf_plane.y float <= #max_Y float \
        if score #min_Z float <= #float4.vec3d.detect_inf_plane.z float \
        if score #float4.vec3d.detect_inf_plane.z float <= #max_Z float run goto :
            tag @s += float4.vec3d.entity_detect_hitbox_raycast
            title @a actionbar [{"text":"[DEBUG] detected"}]
        #   PLANE -Y -> 
        op #nx float = @s float4.vec3.Plane_nY.Nx
        op #ny float = @s float4.vec3.Plane_nY.Ny
        op #nz float = @s float4.vec3.Plane_nY.Nz
        op #ox float = @s float4.vec3.Plane_nY.Ox
        op #oy float = @s float4.vec3.Plane_nY.Oy
        op #oz float = @s float4.vec3.Plane_nY.Oz
        function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main

        if score #df_lib.debug df_debug == 1 :
            op maxX df_debug = #max_X float
            op maxY df_debug = #max_Y float
            op maxZ df_debug = #max_Z float
            op minX df_debug = #min_X float
            op minY df_debug = #min_Y float
            op minZ df_debug = #min_Z float
            op x df_debug = #float4.vec3d.detect_inf_plane.x float
            op y df_debug = #float4.vec3d.detect_inf_plane.y float
            op z df_debug = #float4.vec3d.detect_inf_plane.z float

        if score #float4.vec3d.detect_inf_plane float == 1\
        if score #min_X float <= #float4.vec3d.detect_inf_plane.x float \
        if score #float4.vec3d.detect_inf_plane.x float <= #max_X float \
        if score #min_Y float <= #float4.vec3d.detect_inf_plane.y float \
        if score #float4.vec3d.detect_inf_plane.y float <= #max_Y float \
        if score #min_Z float <= #float4.vec3d.detect_inf_plane.z float \
        if score #float4.vec3d.detect_inf_plane.z float <= #max_Z float run goto :
            tag @s += float4.vec3d.entity_detect_hitbox_raycast
            title @a actionbar [{"text":"[DEBUG] detected"}]
        #   PLANE -Z -> 
        op #nx float = @s float4.vec3.Plane_nZ.Nx
        op #ny float = @s float4.vec3.Plane_nZ.Ny
        op #nz float = @s float4.vec3.Plane_nZ.Nz
        op #ox float = @s float4.vec3.Plane_nZ.Ox
        op #oy float = @s float4.vec3.Plane_nZ.Oy
        op #oz float = @s float4.vec3.Plane_nZ.Oz
        function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main

        if score #df_lib.debug df_debug == 1 :
            op maxX df_debug = #max_X float
            op maxY df_debug = #max_Y float
            op maxZ df_debug = #max_Z float
            op minX df_debug = #min_X float
            op minY df_debug = #min_Y float
            op minZ df_debug = #min_Z float
            op x df_debug = #float4.vec3d.detect_inf_plane.x float
            op y df_debug = #float4.vec3d.detect_inf_plane.y float
            op z df_debug = #float4.vec3d.detect_inf_plane.z float

        if score #float4.vec3d.detect_inf_plane float == 1\
        if score #min_X float <= #float4.vec3d.detect_inf_plane.x float \
        if score #float4.vec3d.detect_inf_plane.x float <= #max_X float \
        if score #min_Y float <= #float4.vec3d.detect_inf_plane.y float \
        if score #float4.vec3d.detect_inf_plane.y float <= #max_Y float \
        if score #min_Z float <= #float4.vec3d.detect_inf_plane.z float \
        if score #float4.vec3d.detect_inf_plane.z float <= #max_Z float run goto :
            tag @s += float4.vec3d.entity_detect_hitbox_raycast
            title @a actionbar [{"text":"[DEBUG] detected"}]
        
        title @a actionbar [{"text":"[DEBUG] Not found"}]

        if score #df_lib.debug df_debug == 1 :
            op maxX df_debug = #max_X float
            op maxY df_debug = #max_Y float
            op maxZ df_debug = #max_Z float
            op minX df_debug = #min_X float
            op minY df_debug = #min_Y float
            op minZ df_debug = #min_Z float
            op x df_debug = #float4.vec3d.detect_inf_plane.x float
            op y df_debug = #float4.vec3d.detect_inf_plane.y float
            op z df_debug = #float4.vec3d.detect_inf_plane.z float


reset #nx float
reset #ny float
reset #nz float
reset #ox float
reset #oy float
reset #oz float
#reset #scaleToDirUpper float
#reset #scaleToDirDown float
#

