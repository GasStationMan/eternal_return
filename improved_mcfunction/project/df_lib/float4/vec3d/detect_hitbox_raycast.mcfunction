


execute if entity @s[type=minecraft:interaction,tag=df_lib_hitbox] at @s positioned ~ ~-1 ~ if entity @p[distance=..10] :
    function df_lib:float4/vec3d/update_hitbox/main

    op #Plane_px.Nx float = @s float4.vec3.Plane_pX.Nx
    op #Plane_px.Ny float = @s float4.vec3.Plane_pX.Ny
    op #Plane_px.Nz float = @s float4.vec3.Plane_pX.Nz
    op #Plane_px.Ox float = @s float4.vec3.Plane_pX.Ox
    op #Plane_px.Oy float = @s float4.vec3.Plane_pX.Oy
    op #Plane_px.Oz float = @s float4.vec3.Plane_pX.Oz

    op #Plane_py.Nx float = @s float4.vec3.Plane_pY.Nx
    op #Plane_py.Ny float = @s float4.vec3.Plane_pY.Ny
    op #Plane_py.Nz float = @s float4.vec3.Plane_pY.Nz
    op #Plane_py.Ox float = @s float4.vec3.Plane_pY.Ox
    op #Plane_py.Oy float = @s float4.vec3.Plane_pY.Oy
    op #Plane_py.Oz float = @s float4.vec3.Plane_pY.Oz

    op #Plane_pz.Nx float = @s float4.vec3.Plane_pZ.Nx
    op #Plane_pz.Ny float = @s float4.vec3.Plane_pZ.Ny
    op #Plane_pz.Nz float = @s float4.vec3.Plane_pZ.Nz
    op #Plane_pz.Ox float = @s float4.vec3.Plane_pZ.Ox
    op #Plane_pz.Oy float = @s float4.vec3.Plane_pZ.Oy
    op #Plane_pz.Oz float = @s float4.vec3.Plane_pZ.Oz

    op #Plane_nx.Nx float = @s float4.vec3.Plane_nX.Nx
    op #Plane_nx.Ny float = @s float4.vec3.Plane_nX.Ny
    op #Plane_nx.Nz float = @s float4.vec3.Plane_nX.Nz
    op #Plane_nx.Ox float = @s float4.vec3.Plane_nX.Ox
    op #Plane_nx.Oy float = @s float4.vec3.Plane_nX.Oy
    op #Plane_nx.Oz float = @s float4.vec3.Plane_nX.Oz

    op #Plane_ny.Nx float = @s float4.vec3.Plane_nY.Nx
    op #Plane_ny.Ny float = @s float4.vec3.Plane_nY.Ny
    op #Plane_ny.Nz float = @s float4.vec3.Plane_nY.Nz
    op #Plane_ny.Ox float = @s float4.vec3.Plane_nY.Ox
    op #Plane_ny.Oy float = @s float4.vec3.Plane_nY.Oy
    op #Plane_ny.Oz float = @s float4.vec3.Plane_nY.Oz

    op #Plane_nz.Nx float = @s float4.vec3.Plane_nZ.Nx
    op #Plane_nz.Ny float = @s float4.vec3.Plane_nZ.Ny
    op #Plane_nz.Nz float = @s float4.vec3.Plane_nZ.Nz
    op #Plane_nz.Ox float = @s float4.vec3.Plane_nZ.Ox
    op #Plane_nz.Oy float = @s float4.vec3.Plane_nZ.Oy
    op #Plane_nz.Oz float = @s float4.vec3.Plane_nZ.Oz

    #max X,Y,Z min X,Y,Z
    op #max_X float = #Plane_px.Ox float
    op #max_Y float = #Plane_py.Oy float
    op #max_Z float = #Plane_pz.Oz float
    
    op #min_X float = #Plane_nx.Ox float
    op #min_Y float = #Plane_ny.Oy float
    op #min_Z float = #Plane_nz.Oz float


    execute as @a[distance=..10] :
        #say [DEBUG] call function df_lib:float4/vec3d/get_entity_pos/main
        function df_lib:float4/vec3d/get_entity_direction/main {rotX:0, rotY:0}
        function df_lib:float4/vec3d/get_entity_pos/main
        add #float4.vec3d.get_entity_pos.y float 17000
        
        #   PLANE +X -> 
        op #nx float = #Plane_px.Nx float
        op #ny float = #Plane_px.Ny float
        op #nz float = #Plane_px.Nz float
        op #ox float = #Plane_px.Ox float
        op #oy float = #Plane_px.Oy float
        op #oz float = #Plane_px.Oz float
        function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main

        if score #float4.vec3d.detect_inf_plane float == 1\
        if score #min_X float <= #float4.vec3d.detect_inf_plane.x float \
        if score #float4.vec3d.detect_inf_plane.x float <= #max_X float \
        if score #min_Y float <= #float4.vec3d.detect_inf_plane.y float \
        if score #float4.vec3d.detect_inf_plane.y float <= #max_Y float \
        if score #min_Z float <= #float4.vec3d.detect_inf_plane.z float \
        if score #float4.vec3d.detect_inf_plane.z float <= #max_Z float run goto :
            title @a actionbar [{"text":"[DEBUG] detected"}]
        
        #   PLANE +Y -> 
        op #nx float = #Plane_py.Nx float
        op #ny float = #Plane_py.Ny float
        op #nz float = #Plane_py.Nz float
        op #ox float = #Plane_py.Ox float
        op #oy float = #Plane_py.Oy float
        op #oz float = #Plane_py.Oz float
        function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main

        if score #float4.vec3d.detect_inf_plane float == 1\
        if score #min_X float <= #float4.vec3d.detect_inf_plane.x float \
        if score #float4.vec3d.detect_inf_plane.x float <= #max_X float \
        if score #min_Y float <= #float4.vec3d.detect_inf_plane.y float \
        if score #float4.vec3d.detect_inf_plane.y float <= #max_Y float \
        if score #min_Z float <= #float4.vec3d.detect_inf_plane.z float \
        if score #float4.vec3d.detect_inf_plane.z float <= #max_Z float run goto :
            title @a actionbar [{"text":"[DEBUG] detected"}]

        #   PLANE +Z -> 
        op #nx float = #Plane_pz.Nx float
        op #ny float = #Plane_pz.Ny float
        op #nz float = #Plane_pz.Nz float
        op #ox float = #Plane_pz.Ox float
        op #oy float = #Plane_pz.Oy float
        op #oz float = #Plane_pz.Oz float
        function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main
        
        if score #float4.vec3d.detect_inf_plane float == 1\
        if score #min_X float <= #float4.vec3d.detect_inf_plane.x float \
        if score #float4.vec3d.detect_inf_plane.x float <= #max_X float \
        if score #min_Y float <= #float4.vec3d.detect_inf_plane.y float \
        if score #float4.vec3d.detect_inf_plane.y float <= #max_Y float \
        if score #min_Z float <= #float4.vec3d.detect_inf_plane.z float \
        if score #float4.vec3d.detect_inf_plane.z float <= #max_Z float run goto :
            title @a actionbar [{"text":"[DEBUG] detected"}]

        #   PLANE -X -> 
        op #nx float = #Plane_nx.Nx float
        op #ny float = #Plane_nx.Ny float
        op #nz float = #Plane_nx.Nz float
        op #ox float = #Plane_nx.Ox float
        op #oy float = #Plane_nx.Oy float
        op #oz float = #Plane_nx.Oz float
        function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main

        if score #float4.vec3d.detect_inf_plane float == 1\
        if score #min_X float <= #float4.vec3d.detect_inf_plane.x float \
        if score #float4.vec3d.detect_inf_plane.x float <= #max_X float \
        if score #min_Y float <= #float4.vec3d.detect_inf_plane.y float \
        if score #float4.vec3d.detect_inf_plane.y float <= #max_Y float \
        if score #min_Z float <= #float4.vec3d.detect_inf_plane.z float \
        if score #float4.vec3d.detect_inf_plane.z float <= #max_Z float run goto :
            title @a actionbar [{"text":"[DEBUG] detected"}]

        #   PLANE -Y -> 
        op #nx float = #Plane_ny.Nx float
        op #ny float = #Plane_ny.Ny float
        op #nz float = #Plane_ny.Nz float
        op #ox float = #Plane_ny.Ox float
        op #oy float = #Plane_ny.Oy float
        op #oz float = #Plane_ny.Oz float
        function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main

        if score #float4.vec3d.detect_inf_plane float == 1\
        if score #min_X float <= #float4.vec3d.detect_inf_plane.x float \
        if score #float4.vec3d.detect_inf_plane.x float <= #max_X float \
        if score #min_Y float <= #float4.vec3d.detect_inf_plane.y float \
        if score #float4.vec3d.detect_inf_plane.y float <= #max_Y float \
        if score #min_Z float <= #float4.vec3d.detect_inf_plane.z float \
        if score #float4.vec3d.detect_inf_plane.z float <= #max_Z float run goto :
            title @a actionbar [{"text":"[DEBUG] detected"}]

        #   PLANE -Z -> 
        op #nx float = #Plane_nz.Nx float
        op #ny float = #Plane_nz.Ny float
        op #nz float = #Plane_nz.Nz float
        op #ox float = #Plane_nz.Ox float
        op #oy float = #Plane_nz.Oy float
        op #oz float = #Plane_nz.Oz float
        function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main

        if score #float4.vec3d.detect_inf_plane float == 1\
        if score #min_X float <= #float4.vec3d.detect_inf_plane.x float \
        if score #float4.vec3d.detect_inf_plane.x float <= #max_X float \
        if score #min_Y float <= #float4.vec3d.detect_inf_plane.y float \
        if score #float4.vec3d.detect_inf_plane.y float <= #max_Y float \
        if score #min_Z float <= #float4.vec3d.detect_inf_plane.z float \
        if score #float4.vec3d.detect_inf_plane.z float <= #max_Z float run goto :
            title @a actionbar [{"text":"[DEBUG] detected"}]

        reset #dirX float
        reset #dirY float
        reset #dirZ float
        reset #float4.vec3d.detect_inf_plane.x float
        reset #float4.vec3d.detect_inf_plane.y float
        reset #float4.vec3d.detect_inf_plane.z float
        reset #scaleToDirUpper float
        reset #scaleToDirDown float

#reset #Plane_width float 
#reset #Plane_height float
#reset #Plane_px.Nx float 
#reset #Plane_px.Ny float 
#reset #Plane_px.Nz float 
#reset #Plane_px.Ox float 
#reset #Plane_px.Oy float 
#reset #Plane_px.Oz float 
#reset #Plane_py.Nx float 
#reset #Plane_py.Ny float 
#reset #Plane_py.Nz float 
#reset #Plane_py.Ox float 
#reset #Plane_py.Oy float 
#reset #Plane_py.Oz float 
#reset #Plane_pz.Nx float 
#reset #Plane_pz.Ny float 
#reset #Plane_pz.Nz float 
#reset #Plane_pz.Ox float 
#reset #Plane_pz.Oy float 
#reset #Plane_pz.Oz float 
#reset #Plane_nx.Nx float 
#reset #Plane_nx.Ny float 
#reset #Plane_nx.Nz float 
#reset #Plane_nx.Ox float 
#reset #Plane_nx.Oy float 
#reset #Plane_nx.Oz float 
#reset #Plane_ny.Nx float 
#reset #Plane_ny.Ny float 
#reset #Plane_ny.Nz float 
#reset #Plane_ny.Ox float 
#reset #Plane_ny.Oy float 
#reset #Plane_ny.Oz float 
#reset #Plane_nz.Nx float 
#reset #Plane_nz.Ny float 
#reset #Plane_nz.Nz float 
#reset #Plane_nz.Ox float 
#reset #Plane_nz.Oy float 
#reset #Plane_nz.Oz float 

