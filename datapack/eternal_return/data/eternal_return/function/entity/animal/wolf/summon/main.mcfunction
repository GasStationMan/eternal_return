$summon minecraft:zombie ^$(dx) ^$(dy) ^$(dz) {Tags:["this","ER.animal.root"],NoAI:1b,Silent:1b,Invulnerable:1b,DeathTime:18,CustomName:'{"color":"green","text":"[ER][ER.animal.root wolf]"}',HasVisualFire:0b,PersistenceRequired:1b,attributes:[{id:"generic.scale",base: 1.0d},{id:"generic.attack_damage",base: 0.0d},{id:"generic.movement_speed",base: 0.45d}]}
$summon ghast ^$(dx) ^$(dy) ^$(dz) {Tags:["this","ER.animal.hitbox"],NoAI:1b,Silent:1b,Health:1000f,DeathTime:18,attributes:[{id:"generic.max_health", base: 1000.0d},{id:"generic.scale", base: 0.7d}]}
$summon text_display ^$(dx) ^$(dy) ^$(dz) {Tags:["this","ER.animal.HPbar"],CustomNameVisible:0b,billboard:"center",text:'{"text":"test.HPshow \\n test.HPbar \\n If you are seeing this massage, that means animal/<this_animal>/main is not working"}'}
execute as @e[  tag= ER.animal.root,tag=this] at @s run function animated_java:animal_wolf/summon
execute as @e[  tag= aj.animal_wolf.root] if score @s aj.id = .aj.last_id aj.id run tag @s add this
tag @e[tag=this,tag= aj.animal_wolf.root] add ER.animal.model
ride @e[tag= this, tag= ER.animal.model, limit= 1] mount @e[tag= this, tag= ER.animal.root, limit= 1]
ride @e[tag= this, tag= ER.animal.HPbar, limit= 1] mount @e[tag= this, tag= ER.animal.hitbox, limit= 1]
effect give @e[tag= this, tag= ER.animal.root  ] invisibility infinite 1 true
effect give @e[tag= this, tag= ER.animal.hitbox] invisibility infinite 1 true
scoreboard players operation @e[tag= this, tag= ER.animal.root  ] ER.health = #ER.animal.wolf.health ER.sys
scoreboard players operation @e[tag= this, tag= ER.animal.hitbox] ER.health = #ER.animal.wolf.health ER.sys
scoreboard players operation @e[tag =this, tag= ER.animal.root  ] ER.cooltime = #ER.animal.wolf.cooltime ER.sys
tag @e[tag=this] add ER.animal.wolf
tag @e[tag=this] add ER.animal
tag @e[tag=this] add ER
$execute at @s as @e[tag=this] run tp @s ~ ~$(dy) ~ ~ 0
function df_library:id/set_id
function eternal_return:entity/store_id
tag @e[tag=this] remove this
