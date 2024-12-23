scoreboard players set #j sys 0
scoreboard players set #k sys 1
data modify storage minecraft:temp temp.j set value 0
data modify storage minecraft:temp temp.k set value 1
function test:ptr_sort/b1/b1/code with storage minecraft:temp temp
scoreboard players add #i sys 1
execute if score #i sys matches ..29 run function test:ptr_sort/b1/code 
