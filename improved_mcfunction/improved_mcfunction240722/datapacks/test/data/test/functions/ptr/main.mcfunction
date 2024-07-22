scoreboard players set #start sys 0
scoreboard players operation #ptr sys = #start sys
data modify storage minecraft:funcstack stack.size set value 29
function test:/ptr/b1/code with storage minecraft:funcstack stack
scoreboard players operation #ptr sys = #start sys
scoreboard players set #inputVar sys 30
data modify storage minecraft:funcstack stack.size set value 29
function test:/ptr/b2/code with storage minecraft:funcstack stack
scoreboard players operation #ptr sys = #start sys
scoreboard players set #i sys 0
function test:/ptr/b3/code
