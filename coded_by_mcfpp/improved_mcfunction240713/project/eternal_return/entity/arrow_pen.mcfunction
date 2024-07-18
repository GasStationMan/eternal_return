#벽뚫화살
set #bool ER.sys 0

if entity @s[nbt={inBlockState:{Name:"minecraft:barrier"}}] : 
    set #bool ER.sys 1

if score #bool ER.sys matches 0 :
    execute store result score @s ER.motionX run data get entity @s Motion[0] 100
    execute store result score @s ER.motionY run data get entity @s Motion[1] 100
    execute store result score @s ER.motionZ run data get entity @s Motion[2] 100


if score #bool ER.sys matches 1 :
    execute store result score #posX ER.sys run data get entity @s Pos[0] 100
    execute store result score #posY ER.sys run data get entity @s Pos[1] 100
    execute store result score #posZ ER.sys run data get entity @s Pos[2] 100
    summon minecraft:arrow ~ ~ ~ {Tags:["this"]}

    set #temp2   ER.sys      2
    op  #vecX    ER.sys  =   #posX  ER.sys
    op  #temp1   ER.sys  =   @s     ER.motionX
    op  #temp1   ER.sys /=   #temp2 ER.sys
    op  #vecX    ER.sys +=   #temp1 ER.sys

    op  #vecY    ER.sys  =   #posY  ER.sys
    op  #temp1   ER.sys  =   @s     ER.motionY
    op  #temp1   ER.sys /=   #temp2 ER.sys
    op  #vecY    ER.sys +=   #temp1 ER.sys

    op  #vecZ    ER.sys  =   #posZ  ER.sys
    op  #temp1   ER.sys  =   @s     ER.motionZ
    op  #temp1   ER.sys /=   #temp2 ER.sys
    op  #vecZ    ER.sys +=   #temp1 ER.sys

    op  #motionX ER.sys  =   @s ER.motionX
    op  #motionY ER.sys  =   @s ER.motionY
    op  #motionZ ER.sys  =   @s ER.motionZ

    #Owner 부여
    data modify entity @e[tag= this, limit= 1] Owner set from entity @s Owner

    execute as @e[tag= this, limit= 1] :
        execute store result entity @s Pos[0] double 0.01 run scoreboard players get #vecX ER.sys
        execute store result entity @s Pos[1] double 0.01 run scoreboard players get #vecY ER.sys
        execute store result entity @s Pos[2] double 0.01 run scoreboard players get #vecZ ER.sys

        execute store result entity @s Motion[0] double 0.01 run scoreboard players get #motionX ER.sys
        execute store result entity @s Motion[1] double 0.01 run scoreboard players get #motionY ER.sys
        execute store result entity @s Motion[2] double 0.01 run scoreboard players get #motionZ ER.sys

        execute store result score @s ER.motionX run data get entity @s Motion[0] 100
        execute store result score @s ER.motionY run data get entity @s Motion[1] 100
        execute store result score @s ER.motionZ run data get entity @s Motion[2] 100
        tag @s add ER.arrow
        tag @e[tag= this] remove this
    #화살 제거
    kill @s

