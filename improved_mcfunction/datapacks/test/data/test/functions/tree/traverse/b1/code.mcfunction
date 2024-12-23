tellraw @a [{"storage":"minecraft:tree","nbt":"stack[-1].data"}]
data modify storage minecraft:tree stack append from storage minecraft:tree stack[-1].left
function test:tree/traverse/main
data modify storage minecraft:tree stack append from storage minecraft:tree stack[-1].right
function test:tree/traverse/main
