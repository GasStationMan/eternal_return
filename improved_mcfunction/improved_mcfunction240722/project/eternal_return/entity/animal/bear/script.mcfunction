
#> 알파 스크립트



score Find_With_This_ID is #this.ID ER.sys
score ID_of_ThisEntity  is @s df_id
storage Animal_Information is minecraft:temp temp


Animal_Information = {animal : "bear", OPTdistance : 20, damage : 5, attackTick : 8, attackDistance : 5}

Find_With_This_ID = ID_of_ThisEntity

#> 아이디 체크 및 동일한 아이디의 구성 엔티티에게 this 태그 부여
function with Animal_Information :
    $execute as @e[tag= ER.animal.$(animal)] if Find_With_This_ID = @s df_id :
        if entity @s[type= minecraft:ghast,       tag=ER.animal.hitbox] run tag @s += this
        if entity @s[type= minecraft:item_display,tag=ER.animal.model ] run tag @s += this
        if entity @s[type= minecraft:text_display,tag=ER.animal.HPbar ] run tag @s += this
        if entity @s[type= minecraft:zombie,      tag=ER.animal.root  ] run tag @s += this

#> 변수 얻어오기

entity HitBox_Entity is @e[type=minecraft:ghast       ,tag=this,tag=ER.animal.hitbox] 
entity Model_Entity  is @e[type=minecraft:item_display,tag=this,tag=ER.animal.model ] 
entity HPbar_Entity  is @e[type=minecraft:text_display,tag=this,tag=ER.animal.model ] 
entity Root_Entity   is @e[type=minecraft:zombie      ,tag=this,tag=ER.animal.root  ] 

score ThisMaxHP is #this.MaxHP  ER.sys
score ThisHP    is #this.HP     ER.sys
score ThisAI    is #this.AI     ER.sys

ThisHP    = HitBox_Entity score ER.health
ThisMaxHP = Root_Entity   score ER.health

#> AI 체크

execute as @s :
    if data entity @s {NoAI:1b} run return run scoreboard players set #this.AI ER.sys 0
    scoreboard players set #this.AI ER.sys 1



#> 최적화 [엔티티 쇼 / 노쇼]
function eternal_return:entity/animal/class/optimize/main with Animal_Information


#> 엔티티의 행동
#> HP > 0
if ThisHP matches 1.. if ThisAI matches 0 run function eternal_return:entity/animal/class/ready/main with Animal_Information
if ThisHP matches 1.. if ThisAI matches 1 run function eternal_return:entity/animal/class/behav/main with Animal_Information

#title @a actionbar [{"nbt":"temp","storage":"minecraft:temp"}]

#> HP <= 0
if ThisHP matches ..0 run function eternal_return:entity/animal/class/death/main with Animal_Information
#if ThisHP matches ..0 run say i died

# 히트박스 위치 조정
execute at @s run tp HitBox_Entity ~ ~ ~

# 다음 엔티티를 위해 모든 boolean 태그 제거 및 this 태그 제거
data remove Animal_Information


ThisAI = 0
scoreboard players set #MotionExist ER.sys 0
tag @e[tag=this] remove this
