storage stack is minecraft:tree stack



    
if data stack[-1].right if data stack[-1].left :

    tellraw @a [{"storage":"minecraft:tree","nbt":"stack[-1].data"}]

    data modify stack append from stack[-1].left
    function test:tree/traverse/main

    data modify stack append from stack[-1].right
    function test:tree/traverse/main

#tellraw @a [{"storage":"minecraft:tree","nbt":"stack[-1]"}]
data remove stack[-1]
#say stack removed


