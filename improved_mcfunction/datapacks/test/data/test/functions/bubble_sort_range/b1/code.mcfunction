scoreboard players set #k sys 1
data modify storage minecraft:loop while.j_range set from storage minecraft:range range
data modify storage minecraft:loop while.k_range set from storage minecraft:range range
data remove storage minecraft:loop while.k_range[0]
data modify storage minecraft:loop while.j set from storage minecraft:loop while.j_range[0]
data modify storage minecraft:loop while.k set from storage minecraft:loop while.k_range[0]
function test:bubble_sort_range/b1/b1/code with storage minecraft:loop while
scoreboard players add #i sys 1
execute if score #i sys < #len sys run function test:bubble_sort_range/b1/code 
