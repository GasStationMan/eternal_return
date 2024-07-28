## 우클릭 했을 때
execute as @a[tag=charlotte,scores={right=1..}] run tag @s add charlotteskill
execute as @a[tag=charlotte,scores={right=1..}] run tag @s add charlottecool
execute as @a[tag=charlotte,scores={right=1..}] run item replace entity @s weapon.mainhand with barrier
execute as @a[tag=charlotte,scores={right=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute as @a[tag=charlotte,scores={right=1..}] at @s run function eternal_return:sys/character/particle/main

## 당근 낚싯대 F 방지
function eternal_return:sys/character/carrot_stick_f

## 샬럿 스킬 효과
execute as @a[tag=charlotteskill] run effect give @s resistance infinite 100 true
execute as @a[tag=charlotteskill] at @s run particle dust{color:[0.431,1.000,0.961],scale:1.5} ~ ~1 ~ 0.5 0.5 0.5 0.03 3 force
execute as @a[tag=charlotteskill] run scoreboard players add @s charlotteskill 1

## 샬럿 스킬 효과 제거
execute as @a[scores={charlotteskill=40..}] run effect clear @s resistance
execute as @a[scores={charlotteskill=40..}] run tag @s remove charlotteskill
execute as @a[scores={charlotteskill=40..}] run scoreboard players reset @s charlotteskill

## 샬럿 스킬 쿨타임
execute as @a[tag=charlottecool] run scoreboard players add @s SC 1
execute as @a[tag=charlotte,scores={SC=540}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=charlotte,scores={SC=560}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=charlotte,scores={SC=580}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=charlotte,scores={SC=600}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute as @a[tag=charlotte,scores={SC=600..}] run item replace entity @s container.4 with carrot_on_a_stick
execute as @a[tag=charlotte,scores={SC=600..}] run tag @s remove charlottecool
execute as @a[tag=charlotte,scores={SC=600..}] run scoreboard players reset @s SC

## 샬럿 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=charlotteskill] unless entity @s[tag=charlotte] run tag @s remove charlotteskill
execute as @a[tag=charlottecool] unless entity @s[tag=charlotte] run tag @s remove charlottecool
execute as @a[scores={charlotteskill=1..}] unless entity @s[tag=charlotte] run scoreboard players reset @s charlotteskill

## 샬럿 태그 보유 시 팀 가입
execute as @a[tag=charlotte,tag=team1] run team join charlotte @s
execute as @a[tag=charlotte,tag=team2] run team join charlotte @s
execute as @a[tag=charlotte,tag=team3] run team join charlotte @s
execute as @a[tag=charlotte,tag=team4] run team join charlotte @s
execute as @a[tag=charlotte,tag=team5] run team join charlotte @s
execute as @a[tag=charlotte,tag=team6] run team join charlotte @s
execute as @a[tag=charlotte,tag=team7] run team join charlotte @s
execute as @a[tag=charlotte,tag=team8] run team join charlotte @s
execute as @a[tag=charlotte,tag=team9] run team join charlotte @s
execute as @a[tag=charlotte,tag=team10] run team join charlotte @s
execute as @a[tag=charlotte,tag=team11] run team join charlotte @s
execute as @a[tag=charlotte,tag=team12] run team join charlotte @s
execute as @a[tag=charlotte,tag=team13] run team join charlotte @s
execute as @a[tag=charlotte,tag=team14] run team join charlotte @s
execute as @a[tag=charlotte,tag=team15] run team join charlotte @s
execute as @a[tag=charlotte,tag=team16] run team join charlotte @s
execute as @a[tag=charlotte,tag=team17] run team join charlotte @s
execute as @a[tag=charlotte,tag=team18] run team join charlotte @s