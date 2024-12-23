scoreboard players set #isExist ER.sys 1
execute as @e[type=minecraft:ghast,tag=ER.animal.hitbox] if score @s df_id = #rootEntityID ER.sys run tag @s add this
scoreboard players operation #this.MaxHP ER.health = @s ER.health
execute if entity @s[tag= ER.animal.bear, distance= 20..] run return run function eternal_return:entity/animal_spawn/b1/b1/b2/b1/code
execute if entity @s[tag= ER.animal.boar, distance= 20..] run return run function eternal_return:entity/animal_spawn/b1/b1/b2/b2/code
execute if entity @s[tag= ER.animal.wolf, distance= 20..] run return run function eternal_return:entity/animal_spawn/b1/b1/b2/b3/code
execute if entity @s[tag= ER.animal.alpha, distance= 20..] run return run function eternal_return:entity/animal_spawn/b1/b1/b2/b4/code
