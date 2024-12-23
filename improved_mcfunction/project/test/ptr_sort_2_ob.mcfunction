#
#storage ptr   is minecraft:funcstack stack

#storage PRINT is minecraft:print print
#score _ptr_s  is #start sys
#score _ptr    is #ptr sys
#score _size   is #size sys
#score tempVar is #TMPVR sys
#
#def print is test:print
#
#_ptr_s  = 0
#_ptr    = _ptr_s


#calloc
#ptr.size = 29
#function with ptr:
#
#    ptr.pos = _ptr
#    function with ptr:
#        $set #$(pos) sys 0
#
#    _ptr += 1
#    $if _ptr == ..$(size) run function BACK
#
#_ptr = _ptr_s

#set #inputVar sys 30
#function with ptr:
#    
#    ptr.pos = _ptr
#    function with ptr:
#        $op #$(pos) sys = #inputVar sys
#    
#    sub #inputVar sys 1
#    _ptr += 1
#    if _ptr == ..29 run function BACK

set #arr 0  29
set #arr 1  28
set #arr 2  27
set #arr 3  26
set #arr 4  25
set #arr 5  24
set #arr 6  23
set #arr 7  22
set #arr 8  21
set #arr 9  20
set #arr 10 19
set #arr 11 18
set #arr 12 17
set #arr 13 16
set #arr 14 15
set #arr 15 14
set #arr 16 13
set #arr 17 12
set #arr 18 11
set #arr 19 10
set #arr 20 9
set #arr 21 8
set #arr 22 7
set #arr 23 6
set #arr 24 5
set #arr 25 4
set #arr 26 3
set #arr 27 2
set #arr 28 1
set #arr 29 0

score i is #i sys
score j is #j sys
score k is #k sys

storage range is  minecraft:range range
storage WHILE is minecraft:loop while

i = 0
function :

    j = 0
    k = 1
    WHILE.j = 0
    WHILE.k = 1
    function with WHILE:

        

        if score #arr $(j) > #arr $(k) run\
            op #arr $(j) >< #arr $(k)

        execute store result WHILE.j int 1 run scoreboard players add #j sys 1
        execute store result WHILE.k int 1 run scoreboard players add #k sys 1
        
        if k == ..29 run function BACK
    
    i += 1
    if i == ..29 run function BACK



#free
#ptr.size = 29
#function :
#
#    ptr.pos = _ptr
#    ptr.var = 0
#    function with ptr:
#        $scoreboard players reset #$(pos) sys
#
#    _ptr += 1
#    $if _ptr == ..$(size) run goto BACK
#
#_ptr = _ptr_s

#function : 
#
#    function with ptr :
#        $tellraw @a [{"score":{"objective":"sys","name":"#$(var)"}}]
#
#    _ptr += 1
#    if _ptr == ..9000 run goto BACK


# -> *(_ptr_s + 1) = 13


#PRINT.ptrpos = ptr.pos
#function with ptr:
#    $set #$(pos) sys 13
#    $execute store result PRINT.value int 1 run scoreboard players get #$(pos) sys
#
#function print with PRINT




