$execute if score #arr $(j) > #arr $(j) run scoreboard players operation #arr $(k) >< #arr $(k)
scoreboard players add #k sys 1
data remove storage minecraft:loop while.j_range[0]
data remove storage minecraft:loop while.k_range[0]
data modify storage minecraft:loop while.j set from storage minecraft:loop while.j_range[0]
data modify storage minecraft:loop while.k set from storage minecraft:loop while.k_range[0]
execute if score #k sys matches ..29 run function test:ptr_sort_2_ob_range/b1/b1/code with storage minecraft:loop while
