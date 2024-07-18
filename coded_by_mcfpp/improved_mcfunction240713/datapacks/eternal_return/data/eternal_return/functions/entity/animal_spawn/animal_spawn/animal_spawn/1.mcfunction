scoreboard players set #HasNoID ER.sys 0
execute if score @s ER.sys matches 2.. run function eternal_return:entity/animal_spawn/animal_spawn/animal_spawn/animal_spawn/0
execute store result score #this.id ER.sys run data get storage minecraft:temp temp.animal[0].id
scoreboard players set #isExist ER.sys 0
execute rotated as @s as @e[type=minecraft:zombie,tag=ER.animal.root] if score @s df_id = #this.id ER.sys run function eternal_return:entity/animal_spawn/animal_spawn/animal_spawn/animal_spawn/1
execute if score #isExist ER.sys matches 0 run function eternal_return:entity/animal_spawn/animal_spawn/animal_spawn/animal_spawn/2
tag @e[tag=this] remove this
