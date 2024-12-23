

storage WHILE    is  minecraft:temp temp
storage arr      is  minecraft:list arr
storage arrFrom  is  minecraft:list temp
storage PRINT    is  minecraft:print print
score i          is  #i sys 
score j          is  #j sys
score k          is  #j2 sys
score cmp1       is  #cmp1 sys
score cmp2       is  #cmp2 sys
score t1         is  #t1 sys
score len_of_arr is  #len sys
score temp       is  #tmp sys

#def printSomething is test:say_hi
#function printSomething

arr = {\
    0: 30,\
    1: 29,\
    2: 28,\
    3: 27,\
    4: 26,\
    5: 25,\
    6: 24,\
    7: 23,\
    8: 22,\
    9: 21,\
    10:20,\
    11:19,\
    12:18,\
    13:17,\
    14:16,\
    15:15,\
    16:14,\
    17:13,\
    18:12,\
    19:11,\
    20:10,\
    21:9,\
    22:8,\
    23:7,\
    24:6,\
    25:5,\
    26:4,\
    27:3,\
    28:2,\
    29:1,\
    }
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
    j = 0
    k = 1
    WHILE.j = j
    WHILE.k = k
    function with WHILE :

        cmp1 = arr.$(j)
        cmp2 = arr.$(k)
        if cmp1 > cmp2 with WHILE :
            WHILE.temp = arr.$(j)
            arr.$(j)  = arr.$(k)
            arr.$(k)  = WHILE.temp

        j += 1
        k += 1
        WHILE.j = j
        WHILE.k = k
        if k == ..29 run function BACK
    
    i += 1
    if i == ..29 run function BACK


#PRINT.arr = arr
#function test:print/main with PRINT

#tellraw @a [{"storage":"minecraft:temp","nbt":"temp"}]
