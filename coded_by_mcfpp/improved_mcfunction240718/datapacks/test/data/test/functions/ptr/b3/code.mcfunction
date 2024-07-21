scoreboard players set #j sys 0
scoreboard players set #k sys 1
function test:/ptr/b3/b3/code
scoreboard players add #i sys 1b3/3 with storage minecraft:funcstack stack
execute if score #i sys matches ..29 run return run function test:
