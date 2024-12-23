op #v1x float = #float4.vec3d.get_entity_direction.x float
op #v1y float = #float4.vec3d.get_entity_direction.y float
op #v1z float = #float4.vec3d.get_entity_direction.z float
op #v2x float = #nx float
op #v2y float = #ny float
op #v2z float = #nz float
#dotprod(Arrow.direction.x,Arrow.direction.y,Arrow.direction.z,1,0,0)
function df_lib:float4/vec3d/dot_prod_v1x_v1y_v1z_v2x_v2y_v2z/main
op #y float = #float4.vec3d.dot_prod float

unless score #y float == 0 : 

    op #v1x float = #ox float
    op #v1x float -= #float4.vec3d.get_entity_pos.x float
    op #v1y float = #oy float
    op #v1y float -= #float4.vec3d.get_entity_pos.y float
    op #v1z float = #oz float
    op #v1z float -= #float4.vec3d.get_entity_pos.z float
    op #v2x float = #nx float
    op #v2y float = #ny float
    op #v2z float = #nz float
    #dotprod(O.x-Arrow.pos.x,O.y-Arrow.pos.y,O.z-Arrow.pos.z,1,0,0)
    function df_lib:float4/vec3d/dot_prod_v1x_v1y_v1z_v2x_v2y_v2z/main
    op #x float = #float4.vec3d.dot_prod float

    if score #x float == 0.. if score #y float == ..-1 run return run\
        set #float4.vec3d.detect_inf_plane float -1
    if score #x float == ..-1 if score #y float == 0.. run return run\
        set #float4.vec3d.detect_inf_plane float -1

    op #x float *= #100 float
    op #x float /= #y float
    
    op #float4.vec3d.detect_inf_plane.x float = #float4.vec3d.get_entity_direction.x float
    op #float4.vec3d.detect_inf_plane.x float /= #100 float
    op #float4.vec3d.detect_inf_plane.x float *= #x float
    op #float4.vec3d.detect_inf_plane.x float += #float4.vec3d.get_entity_pos.x float

    op #float4.vec3d.detect_inf_plane.y float = #float4.vec3d.get_entity_direction.y float
    op #float4.vec3d.detect_inf_plane.y float /= #100 float
    op #float4.vec3d.detect_inf_plane.y float *= #x float
    op #float4.vec3d.detect_inf_plane.y float += #float4.vec3d.get_entity_pos.y float

    op #float4.vec3d.detect_inf_plane.z float = #float4.vec3d.get_entity_direction.z float
    op #float4.vec3d.detect_inf_plane.z float /= #100 float
    op #float4.vec3d.detect_inf_plane.z float *= #x float
    op #float4.vec3d.detect_inf_plane.z float += #float4.vec3d.get_entity_pos.z float
    set #float4.vec3d.detect_inf_plane float 1

#reset #nx float
#reset #ny float
#reset #nz float
#reset #ox float
#reset #oy float
#reset #oz float
#reset #x float
#reset #y float





















