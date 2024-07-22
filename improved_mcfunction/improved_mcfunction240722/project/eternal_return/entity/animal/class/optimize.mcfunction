

#> function eternal_return:entity/animal/calss/optimize/main

storage Animal_info is  minecraft:temp temp
score   tempID      is  #TMPID ER.sys
entity  ThisEntity  is  @s
entity  ModelEntity is  @e[type=minecraft:item_display, tag= this, tag= ER.animal.model]


## enable_model -> turn off optimize
$execute at @s if entity @s[tag= ER.optimized]\
               if entity @p[distance=..$(OPTdistance)] run goto with Animal_info :
    tempID = ThisEntity score df_id
    $function animated_java:animal_$(animal)/summon
    $execute as @e[tag=aj.animal_$(animal).root] if score @s aj.id = .aj.last_id aj.id with Animal_info :
        tag  @s += this
        tag  @s += ER.animal
        tag  @s += ER.animal.model
        $tag @s += ER.animal.$(animal)
        tag  @s -= ER.optimized
        ThisEntity score df_id = tempID
    ride ModelEntity[limit=1] mount @s


## optimize
#execute at @s if not ( entity @s[tag=!ER.optimized] and entity @s[tag=!ER.optimized] ) :\
begin with Animal_info :
    tag @s += ER.optimized
    $execute as ModelEntity run\
        function animated_java:animal_$(animal)/remove/this
