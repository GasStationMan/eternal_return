$summon minecraft:zombie ^$(dx) ^$(dy) ^$(dz) { Tags:["this","ER.animal.root"], NoAI:1b, Silent:1b, Invulnerable:1b, DeathTime:18, CustomName:'{"color":"green","text":"[ER][ER.animal.root]"}', HasVisualFire:0b, PersistenceRequired:1b, ArmorItems:[{},{},{},{id:"minecraft:warped_fungus_on_a_stick",count:1,components:{"minecraft:custom_model_data":1}}], attributes:[{id:"generic.scale",base: 1.0d},{id:"generic.attack_damage",base: 0.0d},{id:"generic.movement_speed",base: 0.4d}] }
$summon ghast ^$(dx) ^$(dy) ^$(dz) {Tags:["this","ER.animal.hitbox"],NoAI:1b,Silent:1b,Health:1000f,DeathTime:18,CustomName:'{"color":"green","text":"[ER][ER.animal.hitbox]"}',PersistenceRequired:1b,attributes:[{id:"generic.max_health", base: 1000.0d},{id:"generic.scale", base: 0.7d}]}
$summon text_display ^$(dx) ^$(dy) ^$(dz) {Tags:["this","ER.animal.HPbar"],CustomNameVisible:0b,billboard:"center"}
execute as @e[type=minecraft:zombie, tag= this, tag= ER.animal.root] at @s run function eternal_return:entity/animal/boar/summon/b1/code
execute as @e[tag=this] run function eternal_return:entity/animal/boar/summon/b2/code
execute on passengers rotated as @s as @e[tag=this] positioned as @s run tp @s ~ ~ ~ ~ 0
function df_library:id/set_id
tag @s add ER.summoned
scoreboard players operation #temp df_id = @e[tag=this,limit=1] df_id
execute store result storage minecraft:df_temp temp.id int 1 run scoreboard players get #temp df_id
data modify storage minecraft:df_temp temp.Pos set from entity @e[tag=this, tag=ER.animal.root, limit=1] Pos
data modify storage minecraft:temp temp.animal append from storage minecraft:df_temp temp
data remove storage minecraft:df_temp temp
tag @e[tag=this] remove this
