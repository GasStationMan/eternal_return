
#storage ptr   is minecraft:funcstack stack
storage WHILE is minecraft:temp temp
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

set #0  sys 29
set #1  sys 28
set #2  sys 27
set #3  sys 26
set #4  sys 25
set #5  sys 24
set #6  sys 23
set #7  sys 22
set #8  sys 21
set #9  sys 20
set #10 sys 19
set #11 sys 18
set #12 sys 17
set #13 sys 16
set #14 sys 15
set #15 sys 14
set #16 sys 13
set #17 sys 12
set #18 sys 11
set #19 sys 10
set #20 sys 9
set #21 sys 8
set #22 sys 7
set #23 sys 6
set #24 sys 5
set #25 sys 4
set #26 sys 3
set #27 sys 2
set #28 sys 1
set #29 sys 0


score i is #i sys
score j is #j sys
score k is #k sys

i = 0
function :

    j = 0
    k = 1
    WHILE.j = 0
    WHILE.k = 1
    function with WHILE:

        if score #$(j) sys > #$(k) sys run op #$(j) sys >< #$(k) sys

        j += 1
        k += 1
        WHILE.j = j
        WHILE.k = k
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




