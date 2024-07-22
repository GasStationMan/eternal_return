execute store result storage minecraft:funcstack stack.pos int 1 run scoreboard players get #ptr sys
function test:/ptr/b2/b2/code with storage minecraft:funcstack stack
scoreboard players remove #inputVar sys 1
scoreboard players add #ptr sys 1
$execute if score #ptr sys matches ..$(size) run return run function test:/ptr/b2/code with storage minecraft:funcstack stack
