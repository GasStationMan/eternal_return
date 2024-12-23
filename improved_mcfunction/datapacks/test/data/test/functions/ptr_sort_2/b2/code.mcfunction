scoreboard players set #j sys 0
scoreboard players set #k sys 1
function test:ptr_sort_2/b2/b2/code
scoreboard players add #i sys 1
execute if score #i sys matches ..29 run function test:ptr_sort_2/b2/code 
