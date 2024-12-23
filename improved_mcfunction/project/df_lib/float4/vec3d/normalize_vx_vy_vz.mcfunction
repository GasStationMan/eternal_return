
op #v1x float = #vx float  
op #v1y float = #vy float  
op #v1z float = #vz float  
op #v2x float = #vx float
op #v2y float = #vy float
op #v2z float = #vz float
function df_lib:float4/vec3d/dot_prod_v1x_v1y_v1z_v2x_v2y_v2z/main
op #a float = #float4.vec3d.dot_prod float
function df_lib:float4/sqrt_a/main
op #float4.vec3d.normalize.x float = #vx float
op #float4.vec3d.normalize.x float *= #10000 float
op #float4.vec3d.normalize.x float /= #float4.sqrt float

op #float4.vec3d.normalize.y float = #vy float
op #float4.vec3d.normalize.y float *= #10000 float
op #float4.vec3d.normalize.y float /= #float4.sqrt float

op #float4.vec3d.normalize.z float = #vz float
op #float4.vec3d.normalize.z float *= #10000 float
op #float4.vec3d.normalize.z float /= #float4.sqrt float

reset #vx float
reset #vy float
reset #vz float
