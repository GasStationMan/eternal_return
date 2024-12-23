scoreboard players set #start sys 0
scoreboard players operation #ptr sys = #start sys
scoreboard players set #inputVar sys 30
function test:ptr_sort_2/b1/code with storage minecraft:funcstack stack
scoreboard players operation #ptr sys = #start sys
scoreboard players set #i sys 0
function test:ptr_sort_2/b2/code
