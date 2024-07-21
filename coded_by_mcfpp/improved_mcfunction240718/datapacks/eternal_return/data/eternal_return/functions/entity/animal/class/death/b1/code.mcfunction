execute as @e[ type=minecraft:ghast,        tag=this, tag=ER.animal.hitbox] run kill @s
execute as @e[ type=minecraft:text_display, tag=this, tag=ER.animal.HPbar ] run kill @s
$execute as @e[type=minecraft:item_display, tag=this, tag=ER.animal.model ] run function animated_java:animal_$(animal)/remove/this
kill @s
