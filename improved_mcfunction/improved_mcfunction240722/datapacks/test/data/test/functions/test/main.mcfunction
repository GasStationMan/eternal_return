data modify storage minecraft:temp temp.arr set value [30,29,28,27,26,25,24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1]
execute store result score #len sys run data get storage minecraft:temp temp.arr
scoreboard players set #j sys 0
scoreboard players set #i sys 0
execute store result storage minecraft:temp temp.i int 1 run scoreboard players get #i sys
execute if score #j sys < #len sys run function test:/test/b1/code with storage minecraft:temp temp
