$execute if score #$(j) sys > #$(k) sys run scoreboard players operation #$(j) sys >< #$(k) sys
scoreboard players add #j sys 1
scoreboard players add #k sys 1
execute store result storage minecraft:temp temp.j int 1 run scoreboard players get #j sys
execute store result storage minecraft:temp temp.k int 1 run scoreboard players get #k sys
execute if score #k sys matches ..29 run function test:ptr_sort/b1/b1/code with storage minecraft:temp temp
