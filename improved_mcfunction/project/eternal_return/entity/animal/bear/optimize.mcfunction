

#> function eternal_return:entity/animal/calss/optimize/main

storage Animal_info is  minecraft:temp temp
entity  ThisEntity  is  @s
entity  ModelEntity is  @e[type=minecraft:item_display, tag= ER.animal.model, tag=this]


## enable_model -> turn off optimize
execute at @s[tag= ER.optimized] if entity @p[distance=..20] run goto:
    op #TEMPID ER.sys = @s df_id
    tag @s -= ER.optimized
    function animated_java:animal_bear/summon/default
    execute as @e[tag=aj.animal_bear.root] if score @s aj.id = aj.last_id aj.id:
        tag @s += this
        tag @s += ER
        tag @s += ER.animal
        tag @s += ER.animal.model
        tag @s += ER.animal.bear
        op  @s df_id = #TEMPID ER.sys
        tag @s += this
        ride @s mount @e[type=minecraft:husk, tag= ER.animal.root, tag=this, limit=1]

## optimize
execute at @s[tag=!ER.optimized] unless entity @p[distance=..21]:
    tag @s += ER.optimized
    execute as ModelEntity run function animated_java:animal_bear/remove/this
