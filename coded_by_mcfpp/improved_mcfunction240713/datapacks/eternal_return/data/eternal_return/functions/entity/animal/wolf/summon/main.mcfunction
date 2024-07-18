$summon minecraft:zombie ^$(dx) ^$(dy) ^$(dz) {Tags:["this","ER.animal.root"],NoAI:1b,Silent:1b,Invulnerable:1b,DeathTime:18,CustomName:'{"color":"green","text":"[ER][ER.animal.root]"}',HasVisualFire:0b,PersistenceRequired:1b,attributes:[{id:"generic.scale",base: 1.0d},{id:"generic.attack_damage",base: 0.0d},{id:"generic.movement_speed",base: 0.3d}]}
$summon ghast ^$(dx) ^$(dy) ^$(dz) {Tags:["this","ER.animal.hitbox"],NoAI:1b,Silent:1b,Health:1000f,DeathTime:18,CustomName:'{"color":"green","text":"[ER][ER.animal.hitbox]"}',PersistenceRequired:1b,attributes:[{id:"generic.max_health", base: 1000.0d},{id:"generic.scale", base: 0.7d}]}
$summon text_display ^$(dx) ^$(dy) ^$(dz) {Tags:["this","ER.animal.HPbar"],CustomNameVisible:0b,billboard:"center"}
execute as @e[type=minecraft:zombie, tag= this, tag= ER.animal.root] at @s run function eternal_return:entity/animal/wolf/summon/summon/0
execute as @e[tag=this] run function eternal_return:entity/animal/wolf/summon/summon/1
function df_library:id/set_id
function eternal_return:entity/store_id
tag @e[tag=this] remove this
