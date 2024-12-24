execute on vehicle run kill @s
kill @e[type=minecraft:ghast       ,tag=ER.animal.hitbox, tag=this, limit=1]
kill @e[type=minecraft:text_display,tag=ER.animal.HPbar , tag=this, limit=1]
function animated_java:animal_boar/remove/this
execute as @e[type=minecraft:item] run function eternal_return:entity/animal/boar/script/b3/b2/b2/b1/code
kill @e[type=minecraft:experience_orb]
