data modify entity @s NoAI set value 1b
scoreboard players operation @e[tag= this, tag= ER.animal.hitbox] ER.health = #this.MaxHP ER.health
execute on passengers as @e[tag= ER.animal.model] run function eternal_return:entity/animal_spawn/animal_spawn/animal_spawn/animal_spawn/animal_spawn/animal_spawn/3
data modify entity @s Pos set from storage minecraft:temp temp.animal[0].Pos
scoreboard players set @s ER.cooltime 400
