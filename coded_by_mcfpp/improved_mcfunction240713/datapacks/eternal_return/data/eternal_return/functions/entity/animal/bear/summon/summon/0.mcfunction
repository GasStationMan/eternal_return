effect give @s invisibility infinite 1 true
effect give @e[type=minecraft:ghast, tag= this, tag= ER.animal.hitbox] invisibility infinite 1 true
function animated_java:animal_bear/summon
execute as @e[type=minecraft:item_display, tag= aj.animal_bear.root] if score @s aj.id = .aj.last_id aj.id run function eternal_return:entity/animal/bear/summon/summon/summon/0
