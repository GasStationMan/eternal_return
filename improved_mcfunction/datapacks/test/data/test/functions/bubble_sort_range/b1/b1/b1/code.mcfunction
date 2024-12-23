$data modify storage minecraft:loop while.temp set from storage minecraft:list arr[$(j)]
$data modify storage minecraft:list arr[$(j)] set from storage minecraft:list arr[$(k)]
$data modify storage minecraft:list arr[$(k)] set from storage minecraft:loop while.temp
