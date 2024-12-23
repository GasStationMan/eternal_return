$execute store result score #cmp1 sys run data get storage minecraft:list arr[$(j)]
$execute store result score #cmp2 sys run data get storage minecraft:list arr[$(k)]
execute if score #cmp1 sys > #cmp2 sys run function test:bubble_sort/b1/b1/b1/code with storage minecraft:temp temp
scoreboard players add #j sys 1
scoreboard players add #j2 sys 1
execute store result storage minecraft:temp temp.j int 1 run scoreboard players get #j sys
execute store result storage minecraft:temp temp.k int 1 run scoreboard players get #j2 sys
execute if score #j2 sys < #len sys run function test:bubble_sort/b1/b1/code with storage minecraft:temp temp
