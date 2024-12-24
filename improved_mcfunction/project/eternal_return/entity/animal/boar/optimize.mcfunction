

#> function eternal_return:entity/animal/calss/optimize/main
entity  modelEntity is  @e[type=minecraft:item_display, tag= ER.animal.model, tag=this]


## enable_model -> turn off optimize
execute at @s[tag= ER.optimized] if entity @p[distance=..10] run goto:
    op #TEMPID ER.sys = @s df_id
    tag @s remove ER.optimized
    function animated_java:animal_boar/summon {args:{}}
    execute as @e[tag=aj.animal_boar.root] if score @s aj.id = aj.last_id aj.id:
        tag @s add this
        tag @s add ER
        tag @s add ER.animal
        tag @s add ER.animal.model
        tag @s add ER.animal.boar
        op  @s df_id = #TEMPID ER.sys
        tag @s add this
        ride @s mount @e[type=minecraft:husk, tag= ER.animal.root, tag=this, limit=1]

## optimize
execute at @s[tag=!ER.optimized] unless entity @p[distance=..20]:
    tag @s add ER.optimized
    execute as modelEntity run function animated_java:animal_boar/remove/this
