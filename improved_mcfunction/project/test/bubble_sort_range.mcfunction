

storage WHILE    is  minecraft:loop while
storage arr      is  minecraft:list arr
storage arrFrom  is  minecraft:list arrfrom
storage arrFrom  is  minecraft:list temp
storage range    is  minecraft:range range
score i          is  #i sys 
score j          is  #j sys
score k          is  #k sys
score cmp1       is  #cmp1 sys
score cmp2       is  #cmp2 sys
score len_of_arr is  #len sys


#def printSomething is test:say_hi
#function printSomething

arr = arrFrom
len_of_arr = arr

#i = 0
#temp = 30
#WHILE.i = i
#function with WHILE :
#    $arr[$(i)] = temp
#    i += 1
#    temp -= 1
#    WHILE.i = i
#    if i == ..29 run function BACK



i = 0
function :
    k = 1

    WHILE.j_range = range
    WHILE.k_range = range
    data remove WHILE.k_range[0]

    WHILE.j = WHILE.j_range[0]
    WHILE.k = WHILE.k_range[0]

    function with WHILE :

        cmp1 = arr[$(j)]
        cmp2 = arr[$(k)]
        if cmp1 > cmp2 with WHILE :
            WHILE.temp = arr[$(j)]
            arr[$(j)]  = arr[$(k)]
            arr[$(k)]  = WHILE.temp

        k += 1
        data remove WHILE.j_range[0]
        data remove WHILE.k_range[0]

        WHILE.j = WHILE.j_range[0]
        WHILE.k = WHILE.k_range[0]

        if k < len_of_arr run function BACK
    
    i += 1
    if i < len_of_arr run function BACK


#PRINT.arr = arr
#function test:print/main with PRINT

#tellraw @a [{"storage":"minecraft:temp","nbt":"temp"}]
