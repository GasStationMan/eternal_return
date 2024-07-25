execute if entity @s[type= minecraft:marker, tag= ER.spawn.animal] positioned as @s if entity @p[distance=..40] run function eternal_return:entity/animal_spawn/main
execute if entity @s[type= minecraft:ghast, tag= ER.animal.hitbox] if score @s ER.health matches 1.. positioned as @s if entity @p[distance=..40] run function eternal_return:entity/hitbox/main
execute if entity @s[type= minecraft:zombie, tag= ER.animal.root] run function eternal_return:entity/main/b1/code
