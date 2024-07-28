## 우클릭 했을 때
execute as @a[tag=elena,scores={right=1..}] run tag @s add elenaskill
execute as @a[tag=elena,scores={right=1..}] run tag @s add elenacool
execute as @a[tag=elena,scores={right=1..}] run item replace entity @s weapon.mainhand with barrier
execute as @a[tag=elena,scores={right=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute as @a[tag=elena,scores={right=1..}] at @s run function eternal_return:sys/character/particle/main

## 당근 낚싯대 F 방지
function eternal_return:sys/character/carrot_stick_f

## 엘레나 스킬 효과
execute as @a[tag=elenaskill] at @s run particle item{item:"blue_ice"} ~ ~ ~ 1.5 0 1.5 0 200 force

function eternal_return:sys/character/elena/enemytag

execute as @e[tag=elenaskill1] at @s run effect give @s slowness 2 1 true
execute as @e[tag=elenaskill1] at @s run particle dust{color:[0.388,1.000,0.980],scale:1} ~ ~ ~ 0.5 0 0.5 0 70 force
execute as @e[tag=elenaskill1] run tag @s remove elenaskill1

## 엘레나 스킬 태그 제거
tag @a[tag=elenaskill] remove elenaskill

## 엘레나 스킬 쿨타임
execute as @a[tag=elenacool] run scoreboard players add @s SC 1
execute as @a[tag=elena,scores={SC=140}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=elena,scores={SC=160}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=elena,scores={SC=180}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=elena,scores={SC=200}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute as @a[tag=elena,scores={SC=200..}] run item replace entity @s container.4 with carrot_on_a_stick
execute as @a[tag=elena,scores={SC=200..}] run tag @s remove elenacool
execute as @a[tag=elena,scores={SC=200..}] run scoreboard players reset @s SC

## 엘레나 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=elenaskill] unless entity @s[tag=elena] run tag @s remove elenaskill
execute as @a[tag=elenacool] unless entity @s[tag=elena] run tag @s remove elenacool

## 엘레나 태그 보유 시 팀 가입
execute as @a[tag=elena,tag=team1] run team join elena @s
execute as @a[tag=elena,tag=team2] run team join elena @s
execute as @a[tag=elena,tag=team3] run team join elena @s
execute as @a[tag=elena,tag=team4] run team join elena @s
execute as @a[tag=elena,tag=team5] run team join elena @s
execute as @a[tag=elena,tag=team6] run team join elena @s
execute as @a[tag=elena,tag=team7] run team join elena @s
execute as @a[tag=elena,tag=team8] run team join elena @s
execute as @a[tag=elena,tag=team9] run team join elena @s
execute as @a[tag=elena,tag=team10] run team join elena @s
execute as @a[tag=elena,tag=team11] run team join elena @s
execute as @a[tag=elena,tag=team12] run team join elena @s
execute as @a[tag=elena,tag=team13] run team join elena @s
execute as @a[tag=elena,tag=team14] run team join elena @s
execute as @a[tag=elena,tag=team15] run team join elena @s
execute as @a[tag=elena,tag=team16] run team join elena @s
execute as @a[tag=elena,tag=team17] run team join elena @s
execute as @a[tag=elena,tag=team18] run team join elena @s