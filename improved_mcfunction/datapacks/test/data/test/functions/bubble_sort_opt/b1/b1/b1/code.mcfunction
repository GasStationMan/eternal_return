$data modify storage minecraft:temp temp.temp set from storage minecraft:list arr.$(j)
$data modify storage minecraft:list arr.$(j) set from storage minecraft:list arr.$(k)
$data modify storage minecraft:list arr.$(k) set from storage minecraft:temp temp.temp
