
storage Animal_info is minecraft:temp temp

#===================================================================================================
#>  eternal_return : 
#>  function eternal_return:entity/animal/death
#===================================================================================================


#
# 체력이 0 이하인 경우 사망 처리

if score #this.AI ER.sys matches 1 run data modify entity @s NoAI set value 1b

execute on passengers with Animal_info:
    $if entity @s[scores = {aj.anim_time = 30},\
                  tag= aj.animal_$(animal).animation.death,\
                  tag= ER.animal.model,\
                  tag= this] with Animal_info:
        
        execute on vehicle :
            say hi
            kill @s
        kill @e[type=minecraft:ghast,        tag=this, tag=ER.animal.hitbox] 
        kill @e[type=minecraft:text_display, tag=this, tag=ER.animal.HPbar ] 
        $function animated_java:animal_$(animal)/remove/this

        execute as @e[type=minecraft:item] :
            if data entity @s {Item:{id:"minecraft:rotten_flesh"}} run return run kill @s
            if data entity @s {Item:{id:"minecraft:gunpowder"}}    run return run kill @s
            if data entity @s {Item:{id:"minecraft:ghast_tear"}}   run return run kill @s
        execute as @e[type=minecraft:experience_orb] run kill @s

    $if entity @s[tag= !aj.animal_$(animal).animation.death,\
                  tag=  aj.animal_$(animal).animation.attack,\
                  tag=  ER.animal.model,\
                  tag= this] run\
        function animated_java:animal_$(animal)/animations/attack/stop

    $if entity @s[tag= !aj.animal_$(animal).animation.death,\
                  tag=  aj.animal_$(animal).animation.move,\
                  tag=  ER.animal.model,\
                  tag= this] run\
        function animated_java:animal_$(animal)/animations/move/stop

    $if entity @s[tag= !aj.animal_$(animal).animation.death,\
                  tag= ER.animal.model,\
                  tag= this] run\
        function animated_java:animal_$(animal)/animations/death/play








