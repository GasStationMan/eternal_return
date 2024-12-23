scoreboard players operation #upTobig float = #O1_I2_sml float
scoreboard players set #temp float 10000
scoreboard players operation #upTobig float /= #temp float
scoreboard players set #temp float 10000
scoreboard players operation #O1_I2_sml float %= #temp float
scoreboard players operation #O1_I2_big float += #upTobig float
