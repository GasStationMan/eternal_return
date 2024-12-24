scoreboard players operation #TEMPID ER.sys = @s df_id
tag @s remove ER.optimized
function animated_java:animal_bear/summon {args:{}}
execute as @e[tag=aj.animal_bear.root] if score @s aj.id = aj.last_id aj.id run function eternal_return:entity/animal/bear/optimize/b1/b1/code
