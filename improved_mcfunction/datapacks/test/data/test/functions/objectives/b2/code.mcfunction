$scoreboard objectives remove test$(i)
execute store result storage minecraft:loop while.i int 1 run scoreboard players add #i sys 1
execute if score #i sys matches ..31 run function test:objectives/b2/code with storage minecraft:loop while
