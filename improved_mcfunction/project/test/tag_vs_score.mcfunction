score i is #i sys
storage while is minecraft:loop while

##f()
#i = 0
#while.i = 0
#function with while:
#    tag @e[type=minecraft:marker,sort=random,limit=1] += this
#    tag @e[type=minecraft:marker,tag=this] -= this
#    execute store result while.i int 1 run scoreboard players add #i sys 1
#    if i == ..31 run function BACK

##g()
i = 0
while.i = 0
function with while:
    set @e[type=minecraft:marker,sort=random,limit=1] sys 1
    set @e[type=minecraft:marker,scores={sys=1}] sys 0
    execute store result while.i int 1 run scoreboard players add #i sys 1
    if i == ..31 run function BACK


#i = 0
#while.i = 0
#function with while:
#    $scoreboard objectives remove test$(i)
#    execute store result while.i int 1 run scoreboard players add #i sys 1
#    if i == ..31 run function BACK
#
#
#
#execute as @e[scores={}]
#execute as @e if score @s {}
