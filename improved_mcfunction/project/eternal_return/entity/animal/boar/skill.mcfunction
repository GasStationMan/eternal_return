#보어의 날리기 스킬


#스킬주체 : 루트 엔티티


entity thisEntity is @s

score P1x is #x0 ER.sys
score P1y is #y0 ER.sys
score P1z is #z0 ER.sys

score P2x is #x2 ER.sys
score P2y is #y2 ER.sys
score P2z is #z2 ER.sys

score dx is #dx ER.sys
score dy is #dy ER.sys
score dz is #dz ER.sys

score i is #i ER.sys

#ModelEntity로 시전자 전환
execute on passengers at @s :
    #DEBUG
    #say called
    
    summon minecraft:marker ~ ~ ~ {Tags:["getTarget"]}
    tp @e[type=minecraft:marker] ~ ~-1 ~ ~ ~

    i = 0
    
    execute as @e[type=minecraft:marker,tag=getTarget] at @s :
        tp @s ^ ^ ^1
        if entity @a[tag=! skillTargeted, distance=..2] run\
            tag @a[tag=! skillTargeted, distance=..2] add skillTargeted
        i += 1
        if i matches ..9 as @s at @s run function BACK
        
        del @s
    
    summon minecraft:marker ^ ^ ^1 {Tags:["vector"]}
    entity VectorEntity is @e[type=minecraft:marker,tag=vector,limit=1]
    entity TargetPlayer is @p[tag=skillTargeted]

    P1x = thisEntity nbt Pos[0] 100000
    P1z = thisEntity nbt Pos[2] 100000
    P2x = VectorEntity nbt Pos[0] 100000
    P2z = VectorEntity nbt Pos[2] 100000

    dx = P2x
    dx -= P1x
    dy = 100000
    dz = P2z
    dz -= P1z

    del VectorEntity

execute as @a[tag=skillTargeted] at @s :

    execute summon minecraft:snowball :
        tp @s ~ ~2.5 ~
        #thisEntity score ER.UUID.0 = TargetPlayer nbt UUID[0]
        #thisEntity score ER.UUID.1 = TargetPlayer nbt UUID[1]
        #thisEntity score ER.UUID.2 = TargetPlayer nbt UUID[2]
        #thisEntity score ER.UUID.3 = TargetPlayer nbt UUID[3]

        thisEntity nbt Motion[0] = dx double 0.000008
        thisEntity nbt Motion[1] = dy double 0.000008
        thisEntity nbt Motion[2] = dz double 0.000008
        
        damage @p[tag=skillTargeted] 5 minecraft:player_attack
        ride @p[tag=skillTargeted] mount @s

    tag @s[tag=skillTargeted] -= skillTargeted



thisEntity nbt Motion[0] = dx double 0.00005
thisEntity nbt Motion[2] = dz double 0.00005
    




