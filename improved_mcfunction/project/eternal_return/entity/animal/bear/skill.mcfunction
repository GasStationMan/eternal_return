execute at @s if entity @a[tag=player,distance=..8] as @a[tag=player,distance=..8] :
    damage @s 6 minecraft:player_attack
    effect give @s minecraft:slowness 3 2