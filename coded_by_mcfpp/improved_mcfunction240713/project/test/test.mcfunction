

storage WHILE    is  minecraft:temp temp
storage arr      is  minecraft:temp temp.arr
score i          is  #i sys 
score j          is  #j sys
score j2         is  #j2 sys
score cmp1       is  #cmp1 sys
score cmp2       is  #cmp2 sys
score t1         is  #t1 sys
score len_of_arr is  #len sys

#def printSomething is test:say_hi
#function printSomething

arr = [2,7,6,5,4,8,9,3,1]
len_of_arr = arr

i = 0
WHILE.i = i
if j < len_of_arr with WHILE :
    j = 0

    j2 = j
    j2 += 1
    WHILE.j = j
    WHILE.j2 = j2
    if j2 < len_of_arr with WHILE :
        
        #t1 = j
        #t1 *= i
        #$tellraw @a [{"text":"$(i) x $(j) = "},{"score":{"name":"#t1","objective":"sys"}}] 

        cmp1 = arr[$(j)]
        cmp2 = arr[$(j2)]
        #   
        #           
        #   
        #   
        #   
        #   
        #   
        if cmp1 > cmp2 with WHILE:

            WHILE.temp = arr[$(j)]
            arr[$(j)]  = arr[$(j2)]
            arr[$(j2)] = WHILE.temp

        j += 1
        WHILE.j = j
        j2 = j
        j2 += 1
        WHILE.j2 = j2
        if j2 < len_of_arr run goto BACK
    
    i += 1
    WHILE.i = i
    if i < len_of_arr run goto BACK

tellraw @a [{"storage":"minecraft:temp","nbt":"temp"}]
