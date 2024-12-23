storage root is minecraft:tree data
storage stack is minecraft:tree stack


root = {right:{},left:{},data: 30}
root.left = {right:{},left:{},data: 29}
root.right = {right:{},left:{},data: 28}
root.right.left = {right:{},left:{},data: 27}
root.right.right = {right:{},left:{},data: 26}
root.left.left = {right:{},left:{},data: 25}
root.left.right = {right:{},left:{},data: 24}

data modify stack append from root
function test:tree/traverse/main