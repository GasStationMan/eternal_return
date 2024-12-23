#> 알파 스크립트
score     self.df_id   is    @s df_id
score     ThisHP       is    #this.HP ER.sys
score     ThisMaxHP    is    #this.MaxHP ER.sys
score     ThisAI       is    #this.AI ER.sys
storage   IDtemp       is    minecraft:temp temp

#> 아이디 체크 및 동일한 아이디의 구성 엔티티에게 this 태그 부여
IDtemp.id = self.df_id
tag @s += this
function with IDtemp :
    $tag @e[type=minecraft:ghast,       scores={df_id=$(id)}] += this
    $tag @e[type=minecraft:text_display,scores={df_id=$(id)}] += this
execute on passengers run tag @s += this

#> 변수 얻어오기
entity HitBox_Entity is @e[type=minecraft:ghast       ,tag=ER.animal.hitbox,tag=this] 
entity Model_Entity  is @e[type=minecraft:item_display,tag=ER.animal.model ,tag=this] 
entity HPbar_Entity  is @e[type=minecraft:text_display,tag=ER.animal.model ,tag=this] 
entity Root_Entity   is @e[type=minecraft:husk      ,tag=ER.animal.root  ,tag=this] 



ThisHP    = HitBox_Entity score ER.health
ThisMaxHP = Root_Entity   score ER.health





#> AI 체크
set #this.AI ER.sys 1
if data Root_Entity[limit=1] NoAI run set #this.AI ER.sys 0


#> 최적화 [엔티티 쇼 / 노쇼]
function eternal_return:entity/animal/wolf/optimize/main


#> 엔티티의 행동
#> HP > 0
if ThisHP matches 1..:
    if ThisAI matches 0 :
        # 체력이 최대 체력 미만인 경우 AI -> true
        if score #this.HP ER.sys < #this.MaxHP ER.sys : 
            data modify entity @s NoAI set value 0b
            scoreboard players set #this.AI ER.sys 1



        # 플레이어가 근처에 가면 발동 -> ready 애니메이션
        execute at @s \
        if entity @p[distance=0..6] \
        if score #this.HP ER.sys = #this.MaxHP ER.sys \
        as Model_Entity[tag=!aj.animal_wolf.animation.ready.playing] run function animated_java:animal_wolf/animations/ready/play

    if ThisAI matches 1 run\
        function eternal_return:entity/animal/wolf/behav/main


#DEATH()
#> HP <= 0
if ThisHP matches ..0 :
    if score #this.AI ER.sys matches 1 run\
        data modify entity @s NoAI set value 1b

    execute on passengers if entity @s[tag=this]:
        if entity @s[type=minecraft:item_display, tag= aj.animal_wolf.animation.death.playing,\
                    tag= ER.animal.model,scores = {aj.death.frame = 30}] run goto :
            
            execute on vehicle run kill @s
            kill @e[type=minecraft:ghast,        tag=ER.animal.hitbox, tag=this] 
            kill @e[type=minecraft:text_display, tag=ER.animal.HPbar , tag=this] 
            function animated_java:animal_wolf/remove/this

            execute as @e[type=minecraft:item] :
                if data entity @s {Item:{id:"minecraft:rotten_flesh"}} run return run kill @s
                if data entity @s {Item:{id:"minecraft:gunpowder"}}    run return run kill @s
                if data entity @s {Item:{id:"minecraft:ghast_tear"}}   run return run kill @s
            
            kill @e[type=minecraft:experience_orb]

        if entity @s[type=minecraft:item_display, tag= ER.animal.model, tag= !aj.animal_wolf.animation.death.playing] :
            function animated_java:animal_wolf/animations/attack/stop
            function animated_java:animal_wolf/animations/move/stop
            function animated_java:animal_wolf/animations/skill/stop
            function animated_java:animal_wolf/animations/death/play

# 히트박스 위치 조정
execute at @s run tp HitBox_Entity ~ ~ ~
tag @e[type=#animal_entity, tag=ER.animal, tag=this] -= this
