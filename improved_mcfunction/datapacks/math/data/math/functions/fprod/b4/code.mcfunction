scoreboard players operation #tmp float = #O2_I1_big float
scoreboard players set #temp float 10000
scoreboard players operation #tmp float /= #temp float
scoreboard players operation #upToInt float += #tmp float
scoreboard players set #temp float 10000
scoreboard players operation #O2_I1_big float %= #temp float
