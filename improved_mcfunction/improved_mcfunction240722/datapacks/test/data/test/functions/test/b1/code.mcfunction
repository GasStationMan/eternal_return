scoreboard players set #j sys 0
scoreboard players operation #j2 sys = #j sys
scoreboard players add #j2 sys 1
execute store result storage minecraft:temp temp.j int 1 run scoreboard players get #j sys
execute store result storage minecraft:temp temp.j2 int 1 run scoreboard players get #j2 sys
execute if score #j2 sys < #len sys run function test:/test/b1/b1/code with storage minecraft:temp temp
scoreboard players add #i sys 1
execute store result storage minecraft:temp temp.i int 1 run scoreboard players get #i sys
execute if score #i sys < #len sys run return run function test:/test/b1/code with storage minecraft:temp temp
