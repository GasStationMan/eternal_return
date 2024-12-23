scoreboard players set #j sys 0
scoreboard players set #k sys 1
data modify storage minecraft:loop while.j set value 0
data modify storage minecraft:loop while.k set value 1
function test:ptr_sort_2_ob/b1/b1/code with storage minecraft:loop while
scoreboard players add #i sys 1
execute if score #i sys matches ..29 run function test:ptr_sort_2_ob/b1/code 
