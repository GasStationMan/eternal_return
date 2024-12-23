op #v1x float /= #100 float
op #v2x float /= #100 float
op #v1x float *= #v2x float

op #v1y float /= #100 float
op #v2y float /= #100 float
op #v1y float *= #v2y float
execute store result score #float4.vec3d.dot_prod float run op #v1x float += #v1y float

op #v1z float /= #100 float
op #v2z float /= #100 float
op #v1z float *= #v2z float
op #float4.vec3d.dot_prod float += #v1z float

#reset #v1x float
#reset #v2x float
#reset #v1y float
#reset #v2y float
#reset #v1z float
#reset #v2z float