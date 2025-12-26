scoreboard players operation #v1x float = #vx float
scoreboard players operation #v1y float = #vy float
scoreboard players operation #v1z float = #vz float
scoreboard players operation #v2x float = #vx float
scoreboard players operation #v2y float = #vy float
scoreboard players operation #v2z float = #vz float
function df_lib:float4/vec3d/dot_prod_v1x_v1y_v1z_v2x_v2y_v2z/main
scoreboard players operation #a float = #float4.vec3d.dot_prod float
function df_lib:float4/sqrt_a/main
scoreboard players operation #float4.vec3d.normalize.x float = #vx float
scoreboard players operation #float4.vec3d.normalize.x float *= #10000 float
scoreboard players operation #float4.vec3d.normalize.x float /= #float4.sqrt float
scoreboard players operation #float4.vec3d.normalize.y float = #vy float
scoreboard players operation #float4.vec3d.normalize.y float *= #10000 float
scoreboard players operation #float4.vec3d.normalize.y float /= #float4.sqrt float
scoreboard players operation #float4.vec3d.normalize.z float = #vz float
scoreboard players operation #float4.vec3d.normalize.z float *= #10000 float
scoreboard players operation #float4.vec3d.normalize.z float /= #float4.sqrt float
scoreboard players reset #vx float
scoreboard players reset #vy float
scoreboard players reset #vz float
