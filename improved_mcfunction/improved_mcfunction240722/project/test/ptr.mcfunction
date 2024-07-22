
storage ptr   is minecraft:funcstack stack
storage PRINT is minecraft:print print
score _ptr_s  is #start sys
score _ptr    is #ptr sys
score _size   is #size sys
score tempVar is #TMPVR sys

def print is test:print

_ptr_s  = 0
_ptr    = _ptr_s


#calloc
ptr.size = 29
function with ptr:

    ptr.pos = _ptr
    function with ptr:
        $set #$(pos) sys 0

    _ptr += 1
    $if _ptr == ..$(size) run goto BACK

_ptr = _ptr_s

set #inputVar sys 30
ptr.size = 29
function with ptr:
    
    ptr.pos = _ptr
    function with ptr:
        $op #$(pos) sys = #inputVar sys
    
    sub #inputVar sys 1
    _ptr += 1
    $if _ptr == ..$(size) run goto BACK

_ptr = _ptr_s

score i is #i sys
score j is #j sys
score k is #k sys

i = 0
function :

    j = 0
    k = 1
    function :

        #say called
        ptr.pos = j 
        function with ptr :
            $op #temp0 sys = #$(pos) sys
        #temp0 = *(_ptr + j)
        
        ptr.pos = k 
        function with ptr :
            $op #temp1 sys = #$(pos) sys

        if score #temp0 sys > #temp1 sys :

            ptr.pos = j 
            function with ptr :
                $op #$(pos) sys = #temp1 sys
            ptr.pos = k 
            function with ptr :
                $op #$(pos) sys = #temp0 sys

        j += 1
        k += 1
        if k == ..29 run goto BACK
    
    i += 1
    if i == ..29 run goto BACK




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




