execute if score @s ER.sys matches 0 run function eternal_return:entity/animal_spawn/b1/b1/code
execute if score @s ER.sys matches 1.. run function eternal_return:entity/animal_spawn/b1/b2/code
execute if score @s[type=minecraft:marker] ER.cooltime matches ..0 run function eternal_return:entity/animal_spawn/b1/b3/code
execute if score @s[type=minecraft:marker] ER.cooltime matches 1.. if score #HasNoID ER.sys matches 1 run function eternal_return:entity/animal_spawn/b1/b4/code
