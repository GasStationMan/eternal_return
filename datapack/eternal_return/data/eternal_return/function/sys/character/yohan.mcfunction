## 우클릭 했을 때
execute as @a[tag=yohan,scores={right=1..}] run tag @s add yohanskill
execute as @a[tag=yohan,scores={right=1..}] run tag @s add yohancool
execute as @a[tag=yohan,scores={right=1..}] run item replace entity @s weapon.mainhand with barrier
execute as @a[tag=yohan,scores={right=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute as @a[tag=yohan,scores={right=1..}] at @s run function eternal_return:sys/character/particle/main

## 당근 낚싯대 F 방지
function eternal_return:sys/character/carrot_stick_f

## 요한 스킬 효과
execute as @a[tag=yohanskill] run effect give @s regeneration infinite 4 true
execute as @a[tag=yohanskill] run effect give @s slowness infinite 4 true
execute as @a[tag=yohanskill] run effect give @s weakness infinite 100 true
execute as @a[tag=yohanskill] at @s run particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0.1 5 force
execute as @a[tag=yohanskill] run scoreboard players add @s yohanskill 1

## 요한 스킬 효과 제거
execute as @a[scores={yohanskill=60..}] run effect clear @s regeneration
execute as @a[scores={yohanskill=60..}] run effect clear @s slowness
execute as @a[scores={yohanskill=60..}] run effect clear @s weakness
execute as @a[scores={yohanskill=60..}] run tag @s remove yohanskill
execute as @a[scores={yohanskill=60..}] run scoreboard players reset @s yohanskill

## 요한 스킬 쿨타임
execute as @a[tag=yohancool] run scoreboard players add @s SC 1
execute as @a[tag=yohan,scores={SC=540}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=yohan,scores={SC=560}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=yohan,scores={SC=580}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=yohan,scores={SC=600}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute as @a[tag=yohan,scores={SC=600..}] run item replace entity @s container.4 with carrot_on_a_stick
execute as @a[tag=yohan,scores={SC=600..}] run tag @s remove yohancool
execute as @a[tag=yohan,scores={SC=600..}] run scoreboard players reset @s SC

## 요한 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=yohanskill] unless entity @s[tag=yohan] run tag @s remove yohanskill
execute as @a[tag=yohancool] unless entity @s[tag=yohan] run tag @s remove yohancool
execute as @a[scores={yohanskill=1..}] unless entity @s[tag=yohan] run scoreboard players reset @s yohanskill

## 요한 태그 보유 시 팀 가입
execute as @a[tag=yohan,tag=team1] run team join yohan @s
execute as @a[tag=yohan,tag=team2] run team join yohan @s
execute as @a[tag=yohan,tag=team3] run team join yohan @s
execute as @a[tag=yohan,tag=team4] run team join yohan @s
execute as @a[tag=yohan,tag=team5] run team join yohan @s
execute as @a[tag=yohan,tag=team6] run team join yohan @s
execute as @a[tag=yohan,tag=team7] run team join yohan @s
execute as @a[tag=yohan,tag=team8] run team join yohan @s
execute as @a[tag=yohan,tag=team9] run team join yohan @s
execute as @a[tag=yohan,tag=team10] run team join yohan @s
execute as @a[tag=yohan,tag=team11] run team join yohan @s
execute as @a[tag=yohan,tag=team12] run team join yohan @s
execute as @a[tag=yohan,tag=team13] run team join yohan @s
execute as @a[tag=yohan,tag=team14] run team join yohan @s
execute as @a[tag=yohan,tag=team15] run team join yohan @s
execute as @a[tag=yohan,tag=team16] run team join yohan @s
execute as @a[tag=yohan,tag=team17] run team join yohan @s
execute as @a[tag=yohan,tag=team18] run team join yohan @s