
# 공격 중인 엔티티 얻어오기
execute on target run tag @s += targeted

storage Animal_info     is      minecraft:temp temp
entity  ModelEntity     is      @e[type=minecraft:item_display,tag=this,tag=ER.animal.model]
entity  ThisEntity      is      @s
score   motionX         is      #motion_x ER.sys
score   motionY         is      #motion_y ER.sys
score   isMotionExist   is      #motionExist ER.sys

#>Motion 얻어오기

motionX = ThisEntity nbt Motion[0] 10000000
motionY = ThisEntity nbt Motion[2] 10000000


function :
    if motionX matches 0 if motionY matches 0 run return run function :
        isMotionExist = 0
    #else :
    isMotionExist = 1
#  +---------------+--------------------------------------------------------------------------------------------+
#  |    VAR_NAME   |                                     VAR_INFO    
#  +---------------+--------------------------------------------------------------------------------------------+
#  | isMotionExist | - this.root에 모션이 있는지 없는지 판단해주는 bool                                             
#  | Animal_info   | - {animal : "alpha", OPTdistance : 20, damage : 5, attackTick : 12, attackDistance : 5}      
#  +---------------+--------------------------------------------------------------------------------------------+


score Cooltime is #cooltime ER.sys
Cooltime = ThisEntity score ER.cooltime


#storage PRINT is minecraft:print print
#PRINT.animal   = Animal_info
#PRINT.Cooltime = Cooltime
#PRINT.HP       = ThisEntity score ER.health
#function eternal_return:system/print/main with PRINT

#  틱에 따른 행동 알고리즘
#  +-----------+-------------------------------+
#  |TIME_STAMP |           Behave              |
#  +-----------+-------------------------------+
#  |81t..      | - Attack() or Move()          |
#  |1..81t     | - Skill_ready()               |
#  |1t         | - Do_skill()                  |
#  |..0t       | - skillCool = skillCool + 80t |
#  +-----------+-------------------------------+

# def attack() is function animated_java:animal_$(animal)/animations/ready/stop
# def attack is function : 

$import animal:ready_play   is animated_java:animal_$(animal)/animations/ready/play
$import animal:ready_stop   is animated_java:animal_$(animal)/animations/ready/stop
$import animal:attack_play  is animated_java:animal_$(animal)/animations/attack/play
$import animal:attack_stop  is animated_java:animal_$(animal)/animations/attack/stop
$import animal:move_play    is animated_java:animal_$(animal)/animations/move/play
$import animal:move_stop    is animated_java:animal_$(animal)/animations/move/stop

$def    animal:skill        is eternal_return:entity/animal/$(animal)/skill



execute at @s as ModelEntity with Animal_info :
    #모델 시선처리
    
    if Cooltime == 1.. on vehicle :
        ThisEntity score ER.cooltime -= 1

    $if entity @s[tag= aj.animal_$(animal).animation.ready] positioned as @s facing entity @p[tag=targeted] feet :
        function animal:ready_stop
        tp @s ~ ~ ~ ~ 0


    #ATTACK 애니메이션 실행 및 로직 발동 Cooltime >= 100 까지
    if Cooltime == 81.. run goto with Animal_info:
        # IF THEN ELSE IF THEN
        execute at @s facing entity @p[tag=targeted,distance=..20] feet run tp @s ~ ~ ~ ~ 0

        $if entity @s[tag= aj.animal_$(animal).animation.attack] on vehicle :
            ThisEntity nbt Motion[0] = 0.0d
            ThisEntity nbt Motion[1] = 0.0d
            ThisEntity nbt Motion[2] = 0.0d
            isMotionExist = 0

        $if entity @p[tag=targeted, distance=..$(attackDistance)] run goto with Animal_info :
            $if entity @s[tag= aj.animal_$(animal).animation.attack,scores={aj.anim_time = $(attackTick)}] run goto with Animal_info :
                damage @p[tag=targeted] $(damage) minecraft:player_attack
            
            $if entity @s[tag=!aj.animal_$(animal).animation.attack] run goto with Animal_info :
                function animal:move_stop
                function animal:attack_play
        
        #MOVE 애니메이션 종료
        if isMotionExist == 0 run goto with Animal_info:
            if entity @s[tag= aj.animal_$(animal).animation.move] with Animal_info:
                function animal:move_stop

        #MOVE 애니메이션 실행 (스킬 사용 중 제외)
        if isMotionExist == 1 run goto with Animal_info:
            $if entity @s[tag=!aj.animal_$(animal).animation.move,tag=!aj.animal_$(animal).animation.attack,tag=!aj.animal_$(animal).animation.skill] with Animal_info:
                function animal:move_play

    #0틱 때 스킬 발동
    if Cooltime == 80 run goto with Animal_info:
        say skill started
        execute on vehicle run effect give @s minecraft:slowness infinite 10
        if entity @s[tag= aj.animal_$(animal).animation.move] with Animal_info :
            function animal:move_stop

    if Cooltime == 1 on vehicle run goto with Animal_info :
        function animal:skill
        
        say skill called

    if Cooltime == 0 run goto with Animal_info :
        # on vehicle로 ...as RootEntity로 전환
        $if entity @s[tag= aj.animal_$(animal).animation.attack,scores={aj.anim_time = 2}] on vehicle :
            effect clear @s minecraft:slowness
            ThisEntity score ER.cooltime = 200
            
        
        # attack 애니메이션 실행 (임시이며 나중에 skill 애니메이션으로 전환 고려)
        $if entity @s[tag=!aj.animal_$(animal).animation.attack] run goto with Animal_info :
            function animal:move_stop
            function animal:attack_play

execute on target run tag @s -= targeted

#>엔티티 시선처리
#execute at @s run tp ModelEntity ~ ~ ~
