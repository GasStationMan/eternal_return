
# 공격 중인 엔티티 얻어오기

storage Animal_info         is      minecraft:temp temp
entity  ModelEntity         is      @e[type=minecraft:item_display,tag=ER.animal.model,tag=this]
entity  ThisEntity          is      @s
score   motionX             is      #motion_x ER.sys
score   motionY             is      #motion_y ER.sys
score   isMotionExist       is      #motionExist ER.sys
score   Cooltime            is      #cooltime ER.sys

import animal:ready_anim_play   is animated_java:animal_wolf/animations/ready/play
import animal:ready_anim_stop   is animated_java:animal_wolf/animations/ready/stop
import animal:skill_anim_play   is animated_java:animal_wolf/animations/skill/play
import animal:skill_anim_stop   is animated_java:animal_wolf/animations/skill/stop
import animal:attack_anim_play  is animated_java:animal_wolf/animations/attack/play
import animal:attack_anim_stop  is animated_java:animal_wolf/animations/attack/stop
import animal:move_anim_play    is animated_java:animal_wolf/animations/move/play
import animal:move_anim_stop    is animated_java:animal_wolf/animations/move/stop

def    animal:skill        is eternal_return:entity/animal/wolf/skill

#>Motion 얻어오기

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

execute on target run tag @s += targeted
set #motionExist ER.sys 1
if data entity @s {Motion:[0.0d,0.0d,0.0d]} run set #motionExist ER.sys 0

#쿨타임 저장
Cooltime = ThisEntity score ER.cooltime

execute at @s on passengers :
    #모델 시선처리
    if entity @s[tag= aj.animal_wolf.animation.ready.playing] run\
        function animal:ready_anim_stop
    
    #ATTACK 애니메이션 실행 및 로직 발동 Cooltime >= 100 까지
    if Cooltime == 1.. run goto:
        # 쿨타임 제거
        execute on vehicle run sub @s ER.cooltime 1
        # IF THEN ELSE IF THEN
        execute at @s facing entity @p[tag=targeted,distance=..20] feet run tp @s ~ ~ ~ ~ 0

        if entity @s[tag= aj.animal_wolf.animation.attack.playing] on vehicle :
            ThisEntity nbt Motion = [0.0d,0.0d,0.0d]
            isMotionExist = 0

        #타겟 범위 확인
        if entity @p[tag=targeted, distance=..4] run goto:
            
            
            if entity @s[tag= aj.animal_wolf.animation.attack.playing] run goto:

                if score @s aj.attack.frame = #ER.animal.wolf.attack_tick_first ER.sys run return run\
                    damage @p[tag=targeted] 5 minecraft:player_attack

                if score @s aj.attack.frame = #ER.animal.wolf.attack_tick_second ER.sys run return run\
                    damage @p[tag=targeted] 5 minecraft:player_attack
            
            
            if entity @s[tag=aj.animal_wolf.animation.move.playing] run function animal:move_anim_stop
            function animal:attack_anim_play
            
        #MOVE 애니메이션 종료
        if isMotionExist == 0 if entity @s[tag= aj.animal_wolf.animation.move.playing] run return run\
            function animal:move_anim_stop

        #MOVE 애니메이션 실행 (스킬 사용 중 제외)
        if isMotionExist == 1 if entity @s[\
        tag=!aj.animal_wolf.animation.move.playing,\
        tag=!aj.animal_wolf.animation.attack.playing,\
        tag=!aj.animal_wolf.animation.skill.playing] run return run\
            function animal:move_anim_play

    #======# 0틱 때 스킬 발동

    if Cooltime == 0 :
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
            # 20 tick
            if score @s aj.skill.frame = #ER.animal.wolf.skill_effect_tick ER.sys on vehicle run\
                function animal:skill
            
            # 스킬 종료
            # 65 tick
            if score @s aj.skill.frame = #ER.animal.wolf.skill_end_tick ER.sys on vehicle :
                effect clear @s minecraft:slowness
                ThisEntity score ER.cooltime = 200
        
        # 스킬 시작
        if entity @s[tag=aj.animal_wolf.animation.move.playing] run function animal:move_anim_stop
        if entity @s[tag=aj.animal_wolf.animation.attack.playing] run function animal:attack_anim_stop
        function animal:skill_anim_play
        execute on vehicle run effect give @s minecraft:slowness infinite 10
            
        

execute on target run tag @s -= targeted

#>엔티티 시선처리
#execute at @s run tp ModelEntity ~ ~ ~
