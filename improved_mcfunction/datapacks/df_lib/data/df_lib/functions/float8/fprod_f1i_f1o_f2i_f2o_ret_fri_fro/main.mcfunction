scoreboard players operation #O2_I1_big float = #f20 float
scoreboard players set #temp float 10000
scoreboard players operation #O2_I1_big float /= #temp float
scoreboard players operation #O2_I1_big float *= #f1i float
scoreboard players operation #O2_I1_sml float = #f20 float
scoreboard players set #temp float 10000
scoreboard players operation #O2_I1_sml float %= #temp float
scoreboard players operation #O2_I1_sml float *= #f1i float
scoreboard players operation #O1_I2_big float = #f1o float
scoreboard players set #temp float 10000
scoreboard players operation #O1_I2_big float /= #temp float
scoreboard players operation #O1_I2_big float *= #f2i float
scoreboard players operation #O1_I2_sml float = #f1o float
scoreboard players set #temp float 10000
scoreboard players operation #O1_I2_sml float %= #temp float
scoreboard players operation #O1_I2_sml float *= #f2i float
scoreboard players set #upToInt float 0
scoreboard players set #upTobig float 0
scoreboard players set #tmp float 0
execute if score #O1_I2_sml float matches 10000.. run function df_lib:float8/fprod_f1i_f1o_f2i_f2o_ret_fri_fro/b1/code
execute if score #O1_I2_big float matches 10000.. run function df_lib:float8/fprod_f1i_f1o_f2i_f2o_ret_fri_fro/b2/code
execute if score #O2_I1_sml float matches 10000.. run function df_lib:float8/fprod_f1i_f1o_f2i_f2o_ret_fri_fro/b3/code
execute if score #O2_I1_big float matches 10000.. run function df_lib:float8/fprod_f1i_f1o_f2i_f2o_ret_fri_fro/b4/code
scoreboard players operation #O3sml float = #O2_I1_sml float
scoreboard players operation #O3sml float += #O1_I2_sml float
scoreboard players operation #O3big float = #O2_I1_big float
scoreboard players operation #O3big float += #O1_I2_big float
execute if score #O3sml float matches 10000.. run function df_lib:float8/fprod_f1i_f1o_f2i_f2o_ret_fri_fro/b5/code
execute if score #O3big float matches 10000.. run function df_lib:float8/fprod_f1i_f1o_f2i_f2o_ret_fri_fro/b6/code
scoreboard players operation #fr0 float = #O3big float
scoreboard players set #temp float 10000
scoreboard players operation #fr0 float *= #temp float
scoreboard players operation #fr0 float += #O3sml float
scoreboard players operation #tmp1 float = #f1o float
scoreboard players set #temp float 10000
scoreboard players operation #tmp1 float /= #temp float
scoreboard players operation #tmp2 float = #f20 float
scoreboard players set #temp float 10000
scoreboard players operation #tmp2 float /= #temp float
scoreboard players operation #tmp float = #tmp1 float
scoreboard players operation #tmp float *= #tmp2 float
scoreboard players operation #fr0 float += #tmp float
scoreboard players operation #fri float = #f1i float
scoreboard players operation #fri float *= #f2i float
scoreboard players operation #fri float += #upToInt float
