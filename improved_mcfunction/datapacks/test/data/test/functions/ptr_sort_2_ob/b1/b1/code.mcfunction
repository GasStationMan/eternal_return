$execute if score #arr $(j) > #arr $(k) run scoreboard players operation #arr $(j) >< #arr $(k)
execute store result storage minecraft:loop while.j int 1 run scoreboard players add #j sys 1
execute store result storage minecraft:loop while.k int 1 run scoreboard players add #k sys 1
execute if score #k sys matches ..29 run function test:ptr_sort_2_ob/b1/b1/code with storage minecraft:loop while
