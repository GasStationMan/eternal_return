scoreboard players set #j sys 0
scoreboard players set #j2 sys 1
execute store result storage minecraft:temp temp.j int 1 run scoreboard players get #j sys
execute store result storage minecraft:temp temp.k int 1 run scoreboard players get #j2 sys
function test:bubble_sort_opt/b1/b1/code with storage minecraft:temp temp
scoreboard players add #i sys 1
execute if score #i sys matches ..29 run function test:bubble_sort_opt/b1/code 
