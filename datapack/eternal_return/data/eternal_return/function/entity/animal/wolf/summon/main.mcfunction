$summon minecraft:husk ^$(dx) ^$(dy) ^$(dz) { Tags:["this","ER.animal.root"], NoAI:1b, Silent:1b, CustomName:'{"color":"green","text":"[ER][ER.animal.root]"}', attributes:[{id:"minecraft:scale",base: 1.0d},{id:"minecraft:attack_damage",base: 0.0d},{id:"minecraft:movement_speed",base: 0.3d}] }
$summon ghast ^$(dx) ^$(dy) ^$(dz) {Tags:["this","ER.animal.hitbox"],NoAI:1b,Silent:1b,Health:1000f,DeathTime:18,CustomName:'{"color":"green","text":"[ER][ER.animal.hitbox]"}',PersistenceRequired:1b,attributes:[{id:"minecraft:max_health", base: 1000.0d},{id:"minecraft:scale", base: 0.6d}]}
$summon text_display ^$(dx) ^$(dy) ^$(dz) {Tags:["this","ER.animal.HPbar"],CustomNameVisible:0b,billboard:"center"}
scoreboard players operation #health ER.sys = #ER.animal.wolf.health ER.sys
scoreboard players operation #cooltime ER.sys = #ER.animal.wolf.cooltime ER.sys
execute as @e[type=minecraft:husk, tag= this, tag= ER.animal.root] run function eternal_return:entity/animal/wolf/summon/b1/code
execute as @e[tag=this] run function eternal_return:entity/animal/wolf/summon/b2/code
tag @s add ER.summoned
execute store result storage minecraft:temp temp.animalStructure.id int 1 run scoreboard players get #tempID ER.sys
data modify storage minecraft:temp temp.animalStructure.Pos set from entity @n[tag=this, tag=ER.animal.root] Pos
execute on vehicle run function eternal_return:entity/animal/wolf/summon/b3/code
data modify storage minecraft:temp temp.animal append from storage minecraft:temp temp.animalStructure
data remove storage minecraft:temp temp.animalStructure
tag @e[tag=this] remove this
