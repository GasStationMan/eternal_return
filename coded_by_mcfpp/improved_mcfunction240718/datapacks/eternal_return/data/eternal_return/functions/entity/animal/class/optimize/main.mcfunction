$execute if entity @s[tag= !ER.optimized] at @s unless entity @p[distance=..$(OPTdistance)] run function eternal_return:entity/animal/class/optimize/b1/code
execute if entity @s[tag= ER.optimized] at @s run function eternal_return:entity/animal/class/optimize/b2/code with storage minecraft:temp temp
