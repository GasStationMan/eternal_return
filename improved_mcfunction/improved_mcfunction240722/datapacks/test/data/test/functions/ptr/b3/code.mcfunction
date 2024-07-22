scoreboard players set #j sys 0
scoreboard players set #k sys 1
function test:/ptr/b3/b3/code
scoreboard players add #i sys 1
execute if score #i sys matches ..29 run return run function test:/ptr/b3/code with storage minecraft:funcstack stack
