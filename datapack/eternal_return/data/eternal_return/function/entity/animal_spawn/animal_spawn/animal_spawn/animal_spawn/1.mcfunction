scoreboard players set #isExist ER.sys 1
execute as @e[type=minecraft:ghast ,tag=ER.animal.hitbox] if score @s df_id = #this.id ER.sys run tag @s add this
scoreboard players operation #this.MaxHP ER.health = @s ER.health
execute as @s[tag= ER.animal.bear, distance= 40..] run return run function eternal_return:entity/animal_spawn/animal_spawn/animal_spawn/animal_spawn/animal_spawn/0
execute as @s[tag= ER.animal.boar, distance= 40..] run return run function eternal_return:entity/animal_spawn/animal_spawn/animal_spawn/animal_spawn/animal_spawn/1
execute as @s[tag= ER.animal.wolf, distance= 40..] run return run function eternal_return:entity/animal_spawn/animal_spawn/animal_spawn/animal_spawn/animal_spawn/2
execute as @s[tag= ER.animal.alpha, distance= 40..] run return run function eternal_return:entity/animal_spawn/animal_spawn/animal_spawn/animal_spawn/animal_spawn/3
