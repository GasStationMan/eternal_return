execute at @s[tag= ER.optimized] if entity @p[distance=..20] run return run function eternal_return:entity/animal/alpha/optimize/b1/code
execute at @s[tag=!ER.optimized] if entity @p[distance=20..] run function eternal_return:entity/animal/alpha/optimize/b2/code
