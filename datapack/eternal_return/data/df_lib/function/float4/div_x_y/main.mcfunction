scoreboard players set #float4.div float 0
scoreboard players set #isNeg float 1
execute if score #y float matches 0 run return run say [DEBUG] DIV /0!ERR
execute if score #x float matches ..-1 run function df_lib:float4/div_x_y/b1/code
execute if score #y float matches ..-1 run function df_lib:float4/div_x_y/b2/code
execute if score #x float = #y float run return run function df_lib:float4/div_x_y/b3/code
scoreboard players operation #test float = #x float
scoreboard players operation #test float /= #y float
execute if score #test float matches 1.. run function df_lib:float4/div_x_y/b4/code
execute store result score #I float run scoreboard players operation #x float *= #10 float
scoreboard players operation #I float /= #y float
scoreboard players operation #x float %= #y float
execute if score #I float matches 1.. run scoreboard players operation #float4.div float += #I float
scoreboard players operation #float4.div float *= #10 float
execute store result score #I float run scoreboard players operation #x float *= #10 float
scoreboard players operation #I float /= #y float
scoreboard players operation #x float %= #y float
execute if score #I float matches 1.. run scoreboard players operation #float4.div float += #I float
scoreboard players operation #float4.div float *= #10 float
execute store result score #I float run scoreboard players operation #x float *= #10 float
scoreboard players operation #I float /= #y float
scoreboard players operation #x float %= #y float
execute if score #I float matches 1.. run scoreboard players operation #float4.div float += #I float
scoreboard players operation #float4.div float *= #10 float
execute store result score #I float run scoreboard players operation #x float *= #10 float
scoreboard players operation #I float /= #y float
execute if score #I float matches 1.. run scoreboard players operation #float4.div float += #I float
scoreboard players operation #float4.div float += #test float
execute if score #isNeg float matches -1 run scoreboard players operation #float4.div float *= #neg float
scoreboard players reset #test float
scoreboard players reset #I float
scoreboard players reset #x float
scoreboard players reset #y float
