scoreboard players operation #TMPID ER.sys = @s df_id
$function animated_java:animal_$(animal)/summon/default
$execute as @e[tag=aj.animal_$(animal).root] if score @s aj.id = aj.last_id aj.id run function eternal_return:entity/animal/class/optimize/b1/b1/code with storage minecraft:temp temp
ride @e[type=minecraft:item_display, tag= this, tag= ER.animal.model, limit=1] mount @s
tag @s add ER.optimized
$execute as @e[type=minecraft:item_display, tag= this, tag= ER.animal.model] run function animated_java:animal_$(animal)/remove/this
