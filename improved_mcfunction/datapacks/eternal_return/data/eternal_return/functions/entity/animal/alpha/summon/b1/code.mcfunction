effect give @s invisibility infinite 1 true
effect give @e[type=minecraft:ghast, tag= this, tag= ER.animal.hitbox] invisibility infinite 1 true
function animated_java:animal_alpha/summon {args:{}}
execute as @e[type=minecraft:item_display, tag= aj.animal_alpha.root] if score @s aj.id = aj.last_id aj.id run function eternal_return:entity/animal/alpha/summon/b1/b1/code
