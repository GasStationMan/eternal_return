scoreboard players operation #uptoO3big float = #O3sml float
scoreboard players set #temp float 10000
scoreboard players operation #uptoO3big float /= #temp float
scoreboard players set #temp float 10000
scoreboard players operation #O3sml float %= #temp float
scoreboard players operation #O3big float += #uptoO3big float
