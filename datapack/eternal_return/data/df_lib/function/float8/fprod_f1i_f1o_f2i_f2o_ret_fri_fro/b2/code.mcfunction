scoreboard players operation #tmp float = #O1_I2_big float
scoreboard players set #temp float 10000
scoreboard players operation #tmp float /= #temp float
scoreboard players operation #upToInt float += #tmp float
scoreboard players set #temp float 10000
scoreboard players operation #O1_I2_big float %= #temp float
