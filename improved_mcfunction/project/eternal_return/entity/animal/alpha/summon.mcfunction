


#> function eternal_return:entity/animal/alpha/summon/data
#>알파 소환

#>SUMMON ENTITY
#좀비 소환
$summon minecraft:husk ^$(dx) ^$(dy) ^$(dz) {\
    Tags:["this","ER.animal.root"],\
    NoAI:1b,\
    Silent:1b,\
    CustomName:'{"color":"green","text":"[ER][ER.animal.root]"}',\
    attributes:[{id:"minecraft:scale",base: 1.0d},{id:"minecraft:attack_damage",base: 0.0d},{id:"minecraft:movement_speed",base: 0.3d}]\
    }
# 히트박스 소환
$summon ghast ^$(dx) ^$(dy) ^$(dz) {Tags:["this","ER.animal.hitbox"],NoAI:1b,Silent:1b,Health:1000f,DeathTime:18,CustomName:'{"color":"green","text":"[ER][ER.animal.hitbox]"}',PersistenceRequired:1b,attributes:[{id:"minecraft:max_health", base: 1000.0d},{id:"minecraft:scale", base: 0.7d}]}

# 체력바 소환
$summon text_display ^$(dx) ^$(dy) ^$(dz) {Tags:["this","ER.animal.HPbar"],CustomNameVisible:0b,billboard:"center"}



#> 모델 소환
#   tag : ER.animal.model

entity RootEntity  is @e[type=minecraft:husk, tag= this, tag= ER.animal.root]
entity ModelEntity is @e[type=minecraft:item_display, tag= this, tag= aj.animal_alpha.root]
entity HPbarEntity is @e[type=minecraft:text_display, tag= this, tag= ER.animal.HPbar]

##params
op #health ER.sys = #ER.animal.alpha.health ER.sys
op #cooltime ER.sys = #ER.animal.alpha.cooltime ER.sys



execute as @e[type=minecraft:husk, tag= this, tag= ER.animal.root]:
    #> 안 보이게 하기
    effect give @s invisibility infinite 1 true
    effect give @e[type=minecraft:ghast, tag= this, tag= ER.animal.hitbox] invisibility infinite 1 true
    
    #> 모델 소환
    function animated_java:animal_alpha/summon {args:{}}
    execute as @e[type=minecraft:item_display, tag= aj.animal_alpha.root] if score @s aj.id = aj.last_id aj.id :
        op #tempID ER.sys = @s aj.id
        tag @s add this
        tag @s add ER.animal.model

#================================================[야생동물 설정]================================================
execute as @e[tag=this] :

    #>아이디 부여
    #temp에 아이디 저장되어 있음
    op @s df_id = #tempID ER.sys

    #> 공통 태그 부여
    tag @s add ER.animal.alpha
    tag @s add ER.animal
    tag @s add ER
    #> 체력 및 스킬 쿨타임
    #> if - else if
    function : 
        if entity @s[tag=ER.animal.root]    run goto :
            op @s ER.health      = #health ER.sys
            op @s ER.cooltime    = #cooltime ER.sys

        if entity @s[tag=ER.animal.hitbox]  run goto :
            op @s ER.health      = #health ER.sys

            #ER.sys scoreboard는 이 엔티티가 처음 소환 된 것인지 파악하는 지표로 쓰입니다.
            set @s ER.sys 0

        if entity @s[tag=ER.animal.model]   run goto :
            ride @s mount @n[tag= this, tag= ER.animal.root]

        if entity @s[tag=ER.animal.HPbar]   run goto :
            ride @s mount @n[tag= this, tag= ER.animal.hitbox]


#execute at @s on vehicle run tp @e[tag=this] ~ ~-3 ~

#> 아이디 부여



#> 아이디 저장
storage animalList        is minecraft:temp temp.animal
storage animalStructure   is minecraft:temp temp.animalStr

##animalStructure의 구조
#   animalStructure{
#       Pos : [double, double, double]
#       id  : int
#   }
#위에 #temp에 아이디 저장해서 한번 돌려쓰기

score   tempID      is #tempID ER.sys
entity  rootEntity  is @n[tag=this, tag=ER.animal.root]

tag @s add ER.summoned
animalStructure.id = tempID
animalStructure.Pos = rootEntity nbt Pos
data modify animalList append from animalStructure

data remove animalStructure
#> this 태그 제거
tag @e[tag=this] remove this




