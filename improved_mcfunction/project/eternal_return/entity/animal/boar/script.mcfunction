#> 알파 스크립트
score     selfID       is    @s df_id
score     thisHP       is    #this.HP ER.sys
score     thisMaxHP    is    #this.MaxHP ER.sys
score     thisAI       is    #this.AI ER.sys
storage   IDtemp       is    minecraft:temp temp


#> 아이디 체크 및 동일한 아이디의 구성 엔티티에게 this 태그 부여
IDtemp.id = selfID
tag @s add this
execute on passengers run tag @s add this
op #this.id ER.sys = @s df_id
execute as @e[type=minecraft:ghast, tag=ER.animal.hitbox] if score @s df_id = #this.id ER.sys:
    tag @s add this
    execute on passengers run tag @s add this

#> 엔티티 매크로
entity hitBoxEntity is @e[type=minecraft:ghast       ,tag=ER.animal.hitbox, tag=this, limit=1] 
entity modelEntity  is @e[type=minecraft:item_display,tag=ER.animal.model , tag=this, limit=1] 
entity hpBarEntity  is @e[type=minecraft:text_display,tag=ER.animal.HPbar , tag=this, limit=1] 
entity rootEntity   is @e[type=minecraft:husk        ,tag=ER.animal.root  , tag=this, limit=1] 
entity thisEntity   is @s

# thisHP : 루트 엔티티가 갖고 있는 체력값 : 최대체력
# thisMaxHP : 히트박스 엔티티가 갖고 있는 체력값 : 현재 체력
thisHP    = hitBoxEntity score ER.health
thisMaxHP = thisEntity   score ER.health





#> AI 체크
set #this.AI ER.sys 1
if data entity @s {NoAI:1b} run set #this.AI ER.sys 0


##> 최적화 [엔티티 쇼 / 노쇼]
#function eternal_return:entity/animal/boar/optimize/main


#> 엔티티의 행동
#> HP > 0
if thisHP == 1..:
    if thisAI == 1 run return run\
        function eternal_return:entity/animal/boar/behav/main

    if thisAI == 0:
        # 체력이 최대 체력 미만인 경우 AI -> true
        if thisHP < thisMaxHP : 
            data modify entity @s NoAI set value 0b
            set #this.AI ER.sys 1
        
        # 플레이어가 근처에 가면 발동 -> ready 애니메이션
        execute positioned as @s \
        if entity @p[distance=0..6] \
        if score #this.HP ER.sys = #this.MaxHP ER.sys \
        as modelEntity[tag=!aj.animal_boar.animation.ready.playing] run\
            function animated_java:animal_boar/animations/ready/play

#DEATH()
#> HP <= 0
if thisHP == ..0 :
    if score #this.AI ER.sys == 1 run\
        data modify entity @s NoAI set value 1b

    execute on passengers if entity @s[tag=this]:
        if entity @s[type=minecraft:item_display, tag= aj.animal_boar.animation.death.playing,\
                    tag= ER.animal.model,scores = {aj.death.frame = 30}] run goto :
            
            execute on vehicle run kill @s
            kill hitBoxEntity
            kill hpBarEntity
            function animated_java:animal_boar/remove/this

            execute as @e[type=minecraft:item] :
                if data entity @s {Item:{id:"minecraft:rotten_flesh"}} run return run kill @s
                if data entity @s {Item:{id:"minecraft:gunpowder"}}    run return run kill @s
                if data entity @s {Item:{id:"minecraft:ghast_tear"}}   run return run kill @s
            
            kill @e[type=minecraft:experience_orb]

        if entity @s[type=minecraft:item_display, tag= ER.animal.model, tag= !aj.animal_boar.animation.death.playing]:
            function animated_java:animal_boar/animations/attack/stop
            function animated_java:animal_boar/animations/move/stop
            function animated_java:animal_boar/animations/skill/stop
            function animated_java:animal_boar/animations/death/play

# 히트박스 위치 조정
hitBoxEntity nbt Pos = thisEntity nbt Pos
tag @e[tag=ER.animal, tag=this] remove this
