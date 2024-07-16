$execute if entity @s[tag= !ER.optimized] at @s unless entity @p[distance=..$(OPTdistance)] run function eternal_return:entity/animal/class/optimize/optimize/0
execute if entity @s[tag= ER.optimized] at @s run function eternal_return:entity/animal/class/optimize/optimize/1 with storage minecraft:temp temp
