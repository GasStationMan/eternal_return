

#> function eternal_return:entity/animal/calss/optimize/main

storage Animal_info is minecraft:temp temp

## optimize
$if entity @s[tag= !ER.optimized] at @s unless entity @p[distance=..$(OPTdistance)] :
    execute as @e[tag= this, tag= ER.animal.model] run function with Animal_info :
        $function animated_java:animal_$(animal)/remove/this
        tag @e[tag = this, tag = ER.animal.root] add ER.optimized

## enable_model -> turn off optimize
if entity @s[tag= ER.optimized] at @s with Animal_info:
    $if entity @p[distance=..$(OPTdistance)] run function with Animal_info :
        $function animated_java:animal_$(animal)/summon
        $execute as @e[tag=aj.animal_$(animal).root] if score @s aj.id = .aj.last_id aj.id run tag @s add this
        $tag @e[tag= this, tag= aj.animal_$(animal).root] add ER.animal.model
        $tag @e[tag= this, tag= aj.animal_$(animal).root] add ER.animal.$(animal)
        $tag @e[tag= this, tag= aj.animal_$(animal).root] add ER.animal
        $scoreboard players operation @e[tag= this, tag= aj.animal_$(animal).root] df_id = @s df_id
        ride @e[tag=this,tag=ER.animal.model ,limit=1] mount @s
        tag @s remove ER.optimized
