# x_next = (x_before + a_num/x_before)/2

#divide technic :
#   
#   

set #float4.div float 0

set #isNeg float 1
if score #y float == 0 run return run say [DEBUG] DIV/0!ERR
if score #x float == ..-1 :
    op #x float *= #neg float
    op #isNeg float *= #neg float

if score #y float == ..-1 :
    op #y float *= #neg float
    op #isNeg float *= #neg float

if score #x float = #y float run goto :
    set #float4.div float 10000

op #test float = #x float
op #test float /= #y float

if score #test float == 1.. :
    op #test float *= #10000 float
    op #x float %= #y float

execute store result score #I float run op #x float *= #10 float
op #I float /= #y float
op #x float %= #y float
if score #I float == 1.. run op #float4.div float += #I float

op #float4.div float *= #10 float
execute store result score #I float run op #x float *= #10 float
op #I float /= #y float
op #x float %= #y float
if score #I float == 1.. run op #float4.div float += #I float

op #float4.div float *= #10 float
execute store result score #I float run op #x float *= #10 float
op #I float /= #y float
op #x float %= #y float
if score #I float == 1.. run op #float4.div float += #I float

op #float4.div float *= #10 float
execute store result score #I float run op #x float *= #10 float
op #I float /= #y float
if score #I float == 1.. run op #float4.div float += #I float

op #float4.div float += #test float
if score #isNeg float == -1 run op #float4.div float *= #neg float

reset #test float
reset #I float
reset #x float
reset #y float