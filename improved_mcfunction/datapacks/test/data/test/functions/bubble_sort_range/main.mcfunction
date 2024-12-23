data modify storage minecraft:list arr set from storage minecraft:list arrfrom
execute store result score #len sys run data get storage minecraft:list arr
scoreboard players set #i sys 0
function test:bubble_sort_range/b1/code
