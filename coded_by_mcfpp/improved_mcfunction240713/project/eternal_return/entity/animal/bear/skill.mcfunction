




# thisEntity is RootEntity
#entity ThisEntity is @s



#곰의 기절 능력
execute positioned ^ ^ ^2 as @a[distance=..3] :
    effect give @s minecraft:slowness 5 5
    damage @s 3 minecraft:player_attack
    

