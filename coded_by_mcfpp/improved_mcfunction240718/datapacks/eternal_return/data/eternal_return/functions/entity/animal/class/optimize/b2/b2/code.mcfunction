$function animated_java:animal_$(animal)/summon
$execute as @e[tag=aj.animal_$(animal).root] if score @s aj.id = .aj.last_id aj.id run tag @s add this
$tag @e[tag= this, tag= aj.animal_$(animal).root] add ER.animal.model
$tag @e[tag= this, tag= aj.animal_$(animal).root] add ER.animal.$(animal)
$tag @e[tag= this, tag= aj.animal_$(animal).root] add ER.animal
$scoreboard players operation @e[tag= this, tag= aj.animal_$(animal).root] df_id = @s df_id
ride @e[tag=this,tag=ER.animal.model ,limit=1] mount @s
tag @s remove ER.optimized
