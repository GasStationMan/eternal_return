execute if score @s ER.sys matches 0 run function eternal_return:entity/animal_spawn/animal_spawn/animal_spawn/0
execute if score @s ER.sys matches 1.. run function eternal_return:entity/animal_spawn/animal_spawn/animal_spawn/1
execute if score @s[type=minecraft:marker] ER.cooltime matches ..0 run function eternal_return:entity/animal_spawn/animal_spawn/animal_spawn/2
execute if score @s[type=minecraft:marker] ER.cooltime matches 1.. if score #HasNoID ER.sys matches 1 run function eternal_return:entity/animal_spawn/animal_spawn/animal_spawn/3
