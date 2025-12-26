data modify storage minecraft:temp temp.animal set from entity @s data.animal
execute positioned as @s if entity @p[distance=..40] run function eternal_return:entity/animal_spawn/b1/code
execute if score @s[type=minecraft:marker] ER.cooltime matches 1.. if score @s ER.sys matches ..0 run function eternal_return:entity/animal_spawn/b2/code
data modify entity @s data.animal set from storage minecraft:temp temp.animal
scoreboard players set #bool ER.sys 0
data remove storage minecraft:temp temp
