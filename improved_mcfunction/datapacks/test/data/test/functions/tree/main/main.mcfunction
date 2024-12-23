data modify storage minecraft:tree data set value {right:{},left:{},data: 30}
data modify storage minecraft:tree data.left set value {right:{},left:{},data: 29}
data modify storage minecraft:tree data.right set value {right:{},left:{},data: 28}
data modify storage minecraft:tree data.right.left set value {right:{},left:{},data: 27}
data modify storage minecraft:tree data.right.right set value {right:{},left:{},data: 26}
data modify storage minecraft:tree data.left.left set value {right:{},left:{},data: 25}
data modify storage minecraft:tree data.left.right set value {right:{},left:{},data: 24}
data modify storage minecraft:tree stack append from storage minecraft:tree data
function test:tree/traverse/main
