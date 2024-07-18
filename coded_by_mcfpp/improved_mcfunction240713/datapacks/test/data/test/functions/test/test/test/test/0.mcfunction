$data modify storage minecraft:temp temp.temp set from storage minecraft:temp temp.arr[$(j)]
$data modify storage minecraft:temp temp.arr[$(j)] set from storage minecraft:temp temp.arr[$(j2)]
$data modify storage minecraft:temp temp.arr[$(j2)] set from storage minecraft:temp temp.temp
