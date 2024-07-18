
storage Animal_info is minecraft:temp temp

#===================================================================================================
#>  eternal_return : 
#>  function eternal_return:entity/animal/death
#===================================================================================================


#
# 체력이 0 이하인 경우 사망 처리

if score #this.AI ER.sys matches 1 run data modify entity @s NoAI set value 1b

$if entity @e[scores = {aj.anim_time = 30},tag= aj.animal_$(animal).animation.death,tag= ER.animal.model,tag= this] run function with Animal_info:
    execute as @e[ type=minecraft:ghast,        tag=this, tag=ER.animal.hitbox] run kill @s
    execute as @e[ type=minecraft:text_display, tag=this, tag=ER.animal.HPbar ] run kill @s
    $execute as @e[type=minecraft:item_display, tag=this, tag=ER.animal.model ] run function animated_java:animal_$(animal)/remove/this
    kill @s

#tellraw @a [{"storage":"minecraft:temp","nbt":"temp"}]

$execute as @e[tag= !aj.animal_$(animal).animation.death,tag= aj.animal_$(animal).animation.attack,tag= ER.animal.model,tag= this] run function animated_java:animal_$(animal)/animations/attack/stop

$execute as @e[tag= !aj.animal_$(animal).animation.death,tag= aj.animal_$(animal).animation.move,tag= ER.animal.model,tag= this] run function animated_java:animal_$(animal)/animations/move/stop

$execute as @e[tag= !aj.animal_$(animal).animation.death,tag= ER.animal.model,tag= this] run function animated_java:animal_$(animal)/animations/death/play








