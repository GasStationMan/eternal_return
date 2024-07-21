


#> function eternal_return:entity/animal/wolf/summon/data
#>곰 소환

#>SUMMON ENTITY
#좀비 소환
$summon minecraft:zombie ^$(dx) ^$(dy) ^$(dz) {Tags:["this","ER.animal.root"],NoAI:1b,Silent:1b,Invulnerable:1b,DeathTime:18,CustomName:'{"color":"green","text":"[ER][ER.animal.root]"}',HasVisualFire:0b,PersistenceRequired:1b,attributes:[{id:"generic.scale",base: 1.0d},{id:"generic.attack_damage",base: 0.0d},{id:"generic.movement_speed",base: 0.3d}]}
# 히트박스 소환
$summon ghast ^$(dx) ^$(dy) ^$(dz) {Tags:["this","ER.animal.hitbox"],NoAI:1b,Silent:1b,Health:1000f,DeathTime:18,CustomName:'{"color":"green","text":"[ER][ER.animal.hitbox]"}',PersistenceRequired:1b,attributes:[{id:"generic.max_health", base: 1000.0d},{id:"generic.scale", base: 0.7d}]}

# 체력바 소환
$summon text_display ^$(dx) ^$(dy) ^$(dz) {Tags:["this","ER.animal.HPbar"],CustomNameVisible:0b,billboard:"center"}



#> 모델 소환
#   tag : ER.animal.model

entity RootEntity  is @e[type=minecraft:zombie, tag= this, tag= ER.animal.root]
entity ModelEntity is @e[type=minecraft:item_display, tag= this, tag= aj.animal_wolf.root]
entity HPbarEntity is @e[type=minecraft:text_display, tag= this, tag= ER.animal.HPbar]
entity ThisEntity  is @s

score  Health      is #ER.animal.wolf.health   ER.sys
score  Cooltime    is #ER.animal.wolf.cooltime ER.sys



execute as @e[type=minecraft:zombie, tag= this, tag= ER.animal.root] at @s :
    #> 안 보이게 하기
    effect give @s invisibility infinite 1 true
    effect give @e[type=minecraft:ghast, tag= this, tag= ER.animal.hitbox] invisibility infinite 1 true
    
    #> 모델 소환
    function animated_java:animal_wolf/summon
    execute as @e[type=minecraft:item_display, tag= aj.animal_wolf.root] if score @s aj.id = .aj.last_id aj.id :
        tag @s += this
        tag @s += ER.animal.model

#================================================[야생동물 설정]================================================
execute as @e[tag=this] :
    #> 공통 태그 부여
    tag @s += ER.animal.wolf
    tag @s += ER.animal
    tag @s += ER
    #> 체력 및 스킬 쿨타임
    begin : 
        if entity @s[tag=ER.animal.root]    run goto :
            ThisEntity score ER.health      = Health
            ThisEntity score ER.cooltime    = 0
            ThisEntity score ER.maxCooltime = Cooltime
            

        if entity @s[tag=ER.animal.hitbox]  run goto :
            ThisEntity score ER.health      = Health
            #ER.sys scoreboard는 이 엔티티가 처음 소환 된 것인지 파악하는 지표로 쓰입니다.
            ThisEntity score ER.sys         = 0

        if entity @s[tag=ER.animal.model]   run goto :
            ride @s mount @e[tag= this, tag= ER.animal.root, limit=1]

        if entity @s[tag=ER.animal.HPbar]   run goto :
            ride @s mount @e[tag= this, tag= ER.animal.hitbox, limit=1]


execute rotated as @s as @e[tag=this] positioned as @s run tp @s ~ ~ ~ ~ 0

#> 아이디 부여
function df_library:id/set_id

#> 아이디 저장
tag @s add ER.summoned
scoreboard players operation #temp df_id = @e[tag=this,limit=1] df_id
execute store result storage minecraft:df_temp temp.id int 1 run scoreboard players get #temp df_id
data modify storage minecraft:df_temp temp.Pos set from entity @e[tag=this, tag=ER.animal.root, limit=1] Pos
data modify storage minecraft:temp temp.animal append from storage minecraft:df_temp temp
data remove storage minecraft:df_temp temp

#> this 태그 제거
tag @e[tag=this] remove this




