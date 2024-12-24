#  틱에 따른 행동 알고리즘
#  +-----------+--------------------------------+
#  |TIME_STAMP |           Behave               |
#  +-----------+--------------------------------+
#  |-61t..     | - Attack() or Move()           |
#  |-1..61t    | - Skill_ready()                |
#  |-1t        | - Do_skill()                   |
#  |-..0t      | - skillCool := skillCool + 80t |
#  +-----------+--------------------------------+

#  +---------------+--------------------------------------------------------------------------------------------+
#  |    VAR_NAME   |                                     VAR_INFO                                               |
#  +---------------+--------------------------------------------------------------------------------------------+
#  | isMotionExist | - this.root에 모션이 있는지 없는지 판단해주는 bool                                            |   
#  | Animal_info   | - {animal : "wolf", OPTdistance : 20, damage : 5, attackTick : 12, attackDistance : 5}    |
#  +---------------+--------------------------------------------------------------------------------------------+


entity  modelEntity         is      @e[type=minecraft:item_display,tag=ER.animal.model,tag=this]
entity  thisEntity          is      @s
score   isMotionExist       is      #motionExist ER.sys
score   cooltime            is      #cooltime ER.sys

import animal:ready_anim_play   is animated_java:animal_wolf/animations/ready/play
import animal:ready_anim_stop   is animated_java:animal_wolf/animations/ready/stop
import animal:skill_anim_play   is animated_java:animal_wolf/animations/skill/play
import animal:skill_anim_stop   is animated_java:animal_wolf/animations/skill/stop
import animal:attack_anim_play  is animated_java:animal_wolf/animations/attack/play
import animal:attack_anim_stop  is animated_java:animal_wolf/animations/attack/stop
import animal:move_anim_play    is animated_java:animal_wolf/animations/move/play
import animal:move_anim_stop    is animated_java:animal_wolf/animations/move/stop

def    animal:skill             is eternal_return:entity/animal/wolf/skill

#공격 대상 얻어오기
execute on target run tag @s add targeted

#Motion 얻어오기
execute store result score #x ER.sys run data get entity @s Motion[0] 1000000
execute store result score #y ER.sys run data get entity @s Motion[1] 1000000
execute store result score #z ER.sys run data get entity @s Motion[2] 1000000

#얻어온 Motion에 따른 isMotionExist 판정
set #motionExist ER.sys 1
if score #x ER.sys == 0 if score #y ER.sys == 0 if score #z ER.sys == 0 run\
    set #motionExist ER.sys 0

#쿨타임 저장
op #cooltime ER.sys = @s ER.cooltime

execute positioned as @s on passengers :

    #> ON modelEntity
    #ready 애니메이션 종료
    if entity @s[tag= aj.animal_wolf.animation.ready.playing] run\
        function animal:ready_anim_stop
    
    #ATTACK & MOVE cooltime >= 100 까지
    if cooltime == 1.. run goto:


        # 플레이어 방향으로 시선 고정
        rotate @s facing entity @p[tag=targeted,distance=..20]
        data modify entity @s Rotation[1] set value 0.0f

        #> ON rootEntity
        # 쿨타임 제거 및 isMotionExist 처리
        execute on vehicle run\
            sub @s ER.cooltime 1

        #> ON rootEntity
        #공격 중에 실행되는 부분
        if entity @s[tag= aj.animal_wolf.animation.attack.playing] run goto:
            
            execute on vehicle :
                thisEntity nbt Motion = [0.0d,0.0d,0.0d]
                isMotionExist = 0

            if score @s aj.attack.frame = #ER.animal.wolf.attack_tick_first ER.sys run return run\
                damage @p[tag=targeted, distance=..4] 5 minecraft:player_attack

            if score @s aj.attack.frame = #ER.animal.wolf.attack_tick_second ER.sys run return run\
                damage @p[tag=targeted, distance=..4] 5 minecraft:player_attack

        #> ON rootEntity
        #공격 시작 조건
        if entity @s[tag=!aj.animal_wolf.animation.attack.playing] if entity @p[tag=targeted, distance=..4] run goto:       
            if entity @s[tag=aj.animal_wolf.animation.move.playing] run\
                function animal:move_anim_stop
            function animal:attack_anim_play

        ##> ELSE
        #isMotionExist 가 0일 시 MOVE 애니메이션 종료
        if isMotionExist == 0 if entity @s[tag= aj.animal_wolf.animation.move.playing] run return run\
            function animal:move_anim_stop
        
        #모든 애니메이션이 실행 중이 아닌 경우 MOVE 애니메이션 실행 (스킬 사용 중 제외)
        if isMotionExist == 1 if entity @s[\
        tag=!aj.animal_wolf.animation.move.playing,\
        tag=!aj.animal_wolf.animation.attack.playing,\
        tag=!aj.animal_wolf.animation.skill.playing] run return run\
            function animal:move_anim_play
        
    #======# 0틱 때 스킬 발동

    if cooltime == 0 :
        # 스킬 발동 중
        if entity @s[tag= aj.animal_wolf.animation.skill.playing] run goto:
            # 이 이후로는 애니메이션 프레임에 따라 행동이 달라짐
            #   +-------------------------------------+-------------------------------------------------------+
            #   |           aj.skill.frame            |                       behaviour                       |
            #   +-------------------------------------+-------------------------------------------------------+                  
            #   | ER.animal.wolf.skill_effect_tick   |  스킬 효과 발동 (ex : 곰의 지면 강타, 멧돼지의 날리기 등) 
            #   | ER.animal.wolf.skill_end_tick      |  스킬 종료
            #   +-------------------------------------+-------------------------------------------------------+

            # 스킬 효과 발동
            if score @s aj.skill.frame = #ER.animal.wolf.skill_effect_tick ER.sys on vehicle :
                function animal:skill
            
            # 스킬 종료
            if score @s aj.skill.frame = #ER.animal.wolf.skill_end_tick ER.sys on vehicle :
                effect clear @s minecraft:slowness
                thisEntity score ER.cooltime = 200
        
        # 스킬 시작
        if entity @s[tag=aj.animal_wolf.animation.move.playing] run\
            function animal:move_anim_stop
        if entity @s[tag=aj.animal_wolf.animation.attack.playing] run\
            function animal:attack_anim_stop
        
        function animal:skill_anim_play
        execute on vehicle run effect give @s minecraft:slowness infinite 10
            
        

execute on target run tag @s remove targeted

