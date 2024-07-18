


#> function eternal_return:entity/animal/boar/summon/data
#>곰 소환

#>SUMMON ENTITY
#좀비 소환
$summon minecraft:zombie ^$(dx) ^$(dy) ^$(dz) {Tags:["this","ER.animal.root"],NoAI:1b,Silent:1b,Invulnerable:1b,DeathTime:18,CustomName:'{"color":"green","text":"[ER][ER.animal.root]"}',HasVisualFire:0b,PersistenceRequired:1b,attributes:[{id:"generic.scale",base: 1.0d},{id:"generic.attack_damage",base: 0.0d},{id:"generic.movement_speed",base: 0.4d}]}
# 히트박스 소환
$summon ghast ^$(dx) ^$(dy) ^$(dz) {Tags:["this","ER.animal.hitbox"],NoAI:1b,Silent:1b,Health:1000f,DeathTime:18,CustomName:'{"color":"green","text":"[ER][ER.animal.hitbox]"}',PersistenceRequired:1b,attributes:[{id:"generic.max_health", base: 1000.0d},{id:"generic.scale", base: 0.7d}]}

# 체력바 소환
$summon text_display ^$(dx) ^$(dy) ^$(dz) {Tags:["this","ER.animal.HPbar"],CustomNameVisible:0b,billboard:"center"}



#> 모델 소환
#   tag : ER.animal.model

entity RootEntity  is @e[type=minecraft:zombie, tag= this, tag= ER.animal.root]
entity ModelEntity is @e[type=minecraft:item_display, tag= this, tag= aj.animal_boar.root]
entity HPbarEntity is @e[type=minecraft:text_display, tag= this, tag= ER.animal.HPbar]
entity ThisEntity  is @s

score  Health      is #ER.animal.boar.health   ER.sys
score  Cooltime    is #ER.animal.boar.cooltime ER.sys



execute as @e[type=minecraft:zombie, tag= this, tag= ER.animal.root] at @s :
    #> 안 보이게 하기
    effect give @s invisibility infinite 1 true
    effect give @e[type=minecraft:ghast, tag= this, tag= ER.animal.hitbox] invisibility infinite 1 true
    
    #> 모델 소환
    function animated_java:animal_boar/summon
    execute as @e[type=minecraft:item_display, tag= aj.animal_boar.root] if score @s aj.id = .aj.last_id aj.id :
        tag @s += this
        tag @s += ER.animal.model

#================================================[야생동물 설정]================================================
execute as @e[tag=this] :
    #> 공통 태그 부여
    tag @s += ER.animal.boar
    tag @s += ER.animal
    tag @s += ER
    #> 체력 및 스킬 쿨타임
    begin : 
        if entity @s[tag=ER.animal.root]    run goto :
            ThisEntity score ER.health      = Health
            ThisEntity score ER.cooltime    = 80
            ThisEntity score ER.maxCooltime = Cooltime

        if entity @s[tag=ER.animal.hitbox]  run goto :
            ThisEntity score ER.health      = Health

        if entity @s[tag=ER.animal.model]   run goto :
            ride @s mount @e[tag= this, tag= ER.animal.root, limit=1]

        if entity @s[tag=ER.animal.HPbar]   run goto :
            ride @s mount @e[tag= this, tag= ER.animal.hitbox, limit=1]


#execute rotated as @s as @e[tag=this] run tp @s @s

#> 아이디 부여
function df_library:id/set_id

#> 아이디 저장
function eternal_return:entity/store_id

#> this 태그 제거
tag @e[tag=this] remove this




