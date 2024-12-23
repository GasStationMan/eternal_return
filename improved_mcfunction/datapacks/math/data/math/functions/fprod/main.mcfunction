scoreboard players operation #O2_I1_big float = #fprodO_2 float
scoreboard players set #temp float 10000
scoreboard players operation #O2_I1_big float /= #temp float
scoreboard players operation #O2_I1_big float *= #fprodI_1 float
scoreboard players operation #O2_I1_sml float = #fprodO_2 float
scoreboard players set #temp float 10000
scoreboard players operation #O2_I1_sml float %= #temp float
scoreboard players operation #O2_I1_sml float *= #fprodI_1 float
scoreboard players operation #O1_I2_big float = #fprodO_1 float
scoreboard players set #temp float 10000
scoreboard players operation #O1_I2_big float /= #temp float
scoreboard players operation #O1_I2_big float *= #fprodI_2 float
scoreboard players operation #O1_I2_sml float = #fprodO_1 float
scoreboard players set #temp float 10000
scoreboard players operation #O1_I2_sml float %= #temp float
scoreboard players operation #O1_I2_sml float *= #fprodI_2 float
scoreboard players set #upToInt float 0
scoreboard players set #upTobig float 0
scoreboard players set #tmp float 0
execute if score #O1_I2_sml float matches 10000.. run function math:fprod/b1/code
execute if score #O1_I2_big float matches 10000.. run function math:fprod/b2/code
execute if score #O2_I1_sml float matches 10000.. run function math:fprod/b3/code
execute if score #O2_I1_big float matches 10000.. run function math:fprod/b4/code
scoreboard players operation #O3sml float = #O2_I1_sml float
scoreboard players operation #O3sml float += #O1_I2_sml float
scoreboard players operation #O3big float = #O2_I1_big float
scoreboard players operation #O3big float += #O1_I2_big float
execute if score #O3sml float matches 10000.. run function math:fprod/b5/code
execute if score #O3big float matches 10000.. run function math:fprod/b6/code
scoreboard players operation #fprodO_ret float = #O3big float
scoreboard players set #temp float 10000
scoreboard players operation #fprodO_ret float *= #temp float
scoreboard players operation #fprodO_ret float += #O3sml float
scoreboard players operation #tmp1 float = #fprodO_1 float
scoreboard players set #temp float 10000
scoreboard players operation #tmp1 float /= #temp float
scoreboard players operation #tmp2 float = #fprodO_2 float
scoreboard players set #temp float 10000
scoreboard players operation #tmp2 float /= #temp float
scoreboard players operation #tmp float = #tmp1 float
scoreboard players operation #tmp float *= #tmp2 float
scoreboard players operation #fprodO_ret float += #tmp float
scoreboard players operation #fprodI_ret float = #fprodI_1 float
scoreboard players operation #fprodI_ret float *= #fprodI_2 float
scoreboard players operation #fprodI_ret float += #upToInt float
