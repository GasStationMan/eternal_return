data modify storage minecraft:temp temp.arr set value [2,7,6,5,4,8,9,3,1]
execute store result score #len sys run data get storage minecraft:temp temp.arr
scoreboard players set #i sys 0
execute store result storage minecraft:temp temp.i int 1 run scoreboard players get #i sys
execute if score #j sys < #len sys run function test:test/test/0 with storage minecraft:temp temp
tellraw @a [{"storage":"minecraft:temp","nbt":"temp"}]
