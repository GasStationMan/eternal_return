scoreboard players set #j sys 0
scoreboard players set #k sys 1
data modify storage minecraft:loop while.j_range set from storage minecraft:range range
data modify storage minecraft:loop while.k_range set from storage minecraft:range range
data remove storage minecraft:loop while.k_range[0]
data modify storage minecraft:loop while.j set from storage minecraft:loop while.j_range[0]
data modify storage minecraft:loop while.k set from storage minecraft:loop while.k_range[0]
function test:ptr_sort_2_ob_range/b1/b1/code with storage minecraft:loop while
scoreboard players add #i sys 1
execute if score #i sys matches ..29 run function test:ptr_sort_2_ob_range/b1/code 
