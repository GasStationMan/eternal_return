
execute store result score #Pos.x float run data get entity @s Pos[0] 10000
execute store result score #Pos.y float run data get entity @s Pos[1] 10000
execute store result score #Pos.z float run data get entity @s Pos[2] 10000
#=========================================================# +X
set @s float4.vec3.Plane_pX.Nx 10000
set @s float4.vec3.Plane_pX.Ny 0
set @s float4.vec3.Plane_pX.Nz 0
op  @s float4.vec3.Plane_pX.Ox = #Pos.x float
op  @s float4.vec3.Plane_pX.Ox += @s float4.vec3.width
op  @s float4.vec3.Plane_pX.Oy = #Pos.y float
op  @s float4.vec3.Plane_pX.Oy -= @s float4.vec3.height
op  @s float4.vec3.Plane_pX.Oz = #Pos.z float
#=========================================================# +Y
set @s float4.vec3.Plane_pY.Nx 0
set @s float4.vec3.Plane_pY.Ny 10000
set @s float4.vec3.Plane_pY.Nz 0
op  @s float4.vec3.Plane_pY.Ox = #Pos.x float
op  @s float4.vec3.Plane_pY.Oy = #Pos.y float
op  @s float4.vec3.Plane_pY.Oz = #Pos.z float
#=========================================================# +Z
set @s float4.vec3.Plane_pZ.Nx 0
set @s float4.vec3.Plane_pZ.Ny 0
set @s float4.vec3.Plane_pZ.Nz 10000
op  @s float4.vec3.Plane_pZ.Ox = #Pos.x float
op  @s float4.vec3.Plane_pZ.Oy = #Pos.y float
op  @s float4.vec3.Plane_pZ.Oy -= @s float4.vec3.height
op  @s float4.vec3.Plane_pZ.Oz = #Pos.z float
op  @s float4.vec3.Plane_pZ.Oz += @s float4.vec3.width
#=========================================================# -X
set @s float4.vec3.Plane_nX.Nx -10000
set @s float4.vec3.Plane_nX.Ny 0
set @s float4.vec3.Plane_nX.Nz 0
op  @s float4.vec3.Plane_nX.Ox = #Pos.x float
op  @s float4.vec3.Plane_nX.Ox -= @s float4.vec3.width
op  @s float4.vec3.Plane_nX.Oy = #Pos.y float
op  @s float4.vec3.Plane_nX.Oy -= @s float4.vec3.height
op  @s float4.vec3.Plane_nX.Oz = #Pos.z float
#=========================================================# -Y
set @s float4.vec3.Plane_nY.Nx 0
set @s float4.vec3.Plane_nY.Ny -10000
set @s float4.vec3.Plane_nY.Nz 0
op  @s float4.vec3.Plane_nY.Ox = #Pos.x float
op  @s float4.vec3.Plane_nY.Oy = #Pos.y float
op  @s float4.vec3.Plane_nY.Oy -= @s float4.vec3.height
op  @s float4.vec3.Plane_nY.Oy -= @s float4.vec3.height
op  @s float4.vec3.Plane_nY.Oz = #Pos.z float
#=========================================================# -Z
set @s float4.vec3.Plane_nZ.Nx 0
set @s float4.vec3.Plane_nZ.Ny 0
set @s float4.vec3.Plane_nZ.Nz -10000
op  @s float4.vec3.Plane_nZ.Ox = #Pos.x float
op  @s float4.vec3.Plane_nZ.Oy = #Pos.y float
op  @s float4.vec3.Plane_nZ.Oy -= @s float4.vec3.height
op  @s float4.vec3.Plane_nZ.Oz = #Pos.z float
op  @s float4.vec3.Plane_nZ.Oz -= @s float4.vec3.width

reset #Pos.x float
reset #Pos.y float
reset #Pos.z float