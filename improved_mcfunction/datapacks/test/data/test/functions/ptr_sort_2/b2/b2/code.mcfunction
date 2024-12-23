execute store result storage minecraft:funcstack stack.pos int 1 run scoreboard players get #j sys
function test:ptr_sort_2/b2/b2/b1/code with storage minecraft:funcstack stack
execute store result storage minecraft:funcstack stack.pos int 1 run scoreboard players get #k sys
function test:ptr_sort_2/b2/b2/b2/code with storage minecraft:funcstack stack
execute if score #temp0 sys > #temp1 sys run function test:ptr_sort_2/b2/b2/b3/code
scoreboard players add #j sys 1
scoreboard players add #k sys 1
execute if score #k sys matches ..29 run function test:ptr_sort_2/b2/b2/code 
