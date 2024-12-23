$execute store result score #cmp1 sys run data get storage minecraft:list arr[$(j)]
$execute store result score #cmp2 sys run data get storage minecraft:list arr[$(k)]
execute if score #cmp1 sys > #cmp2 sys run function test:bubble_sort_range/b1/b1/b1/code with storage minecraft:loop while
scoreboard players add #k sys 1
data remove storage minecraft:loop while.j_range[0]
data remove storage minecraft:loop while.k_range[0]
data modify storage minecraft:loop while.j set from storage minecraft:loop while.j_range[0]
data modify storage minecraft:loop while.k set from storage minecraft:loop while.k_range[0]
execute if score #k sys < #len sys run function test:bubble_sort_range/b1/b1/code with storage minecraft:loop while
