execute on vehicle run function eternal_return:entity/animal/class/death/b1/b1/b1/code
kill @e[type=minecraft:ghast,        tag=this, tag=ER.animal.hitbox]
kill @e[type=minecraft:text_display, tag=this, tag=ER.animal.HPbar ]
$function animated_java:animal_$(animal)/remove/this
execute as @e[type=minecraft:item] run function eternal_return:entity/animal/class/death/b1/b1/b2/code
execute as @e[type=minecraft:experience_orb] run kill @s
