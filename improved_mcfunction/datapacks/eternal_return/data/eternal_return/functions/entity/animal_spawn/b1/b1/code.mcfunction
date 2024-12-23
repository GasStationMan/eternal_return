execute if score @s ER.sys matches 2.. run function eternal_return:entity/animal_spawn/b1/b1/b1/code
execute store result score #rootEntityID ER.sys run data get storage minecraft:temp temp.animal[0].id
scoreboard players set #isExist ER.sys 0
execute on vehicle at @s as @e[type=minecraft:husk,tag=ER.animal.root] if score @s df_id = #rootEntityID ER.sys run function eternal_return:entity/animal_spawn/b1/b1/b2/code
execute if score #isExist ER.sys matches 0 run function eternal_return:entity/animal_spawn/b1/b1/b3/code
