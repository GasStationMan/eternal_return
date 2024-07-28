## 레녹스가 때렸을 때
execute as @a[tag=lenox,scores={dmggive=0..},tag=!lenoxcool] run tag @s add lenoxskill
execute as @a[tag=lenox,scores={dmggive=0..},tag=!lenoxcool] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2
execute as @a[tag=lenox,scores={dmggive=0..}] run tag @s add lenoxcool

## 스킬 사용 이펙트
execute as @a[tag=lenox,scores={dmggive=0..},tag=!lenoxcool] at @s run function eternal_return:sys/character/particle/main

## 레녹스 스킬 효과
execute as @a[tag=lenoxskill] run scoreboard players add @s lenoxskill 1
execute as @a[scores={lenoxskill=1}] run effect give @s absorption infinite 0 true
execute as @a[tag=lenoxskill] at @s run particle dust{color:[1.000,0.910,0.098],scale:1.5} ~ ~1 ~ 0.5 0.5 0.5 0.03 3 force

## 레녹스 스킬 효과 제거
execute as @a[scores={lenoxskill=40..}] run effect clear @s absorption
execute as @a[scores={lenoxskill=40..}] run tag @s remove lenoxskill
execute as @a[scores={lenoxskill=40..}] run scoreboard players reset @s lenoxskill

## 레녹스 스킬 쿨타임
execute as @a[tag=lenoxcool] run scoreboard players add @s SC 1
execute as @a[tag=lenox,scores={SC=140}] run tellraw @s ["",{"text":"3초 후 패시브 스킬이 활성화 됩니다.","color":"yellow"}]
execute as @a[tag=lenox,scores={SC=160}] run tellraw @s ["",{"text":"2초 후 패시브 스킬이 활성화 됩니다.","color":"yellow"}]
execute as @a[tag=lenox,scores={SC=180}] run tellraw @s ["",{"text":"1초 후 패시브 스킬이 활성화 됩니다.","color":"yellow"}]
execute as @a[tag=lenox,scores={SC=200}] run tellraw @s ["",{"text":"패시브 활성화!","color":"aqua"}]
execute as @a[tag=lenox,scores={SC=200..}] run tag @s remove lenoxcool
execute as @a[tag=lenox,scores={SC=200..}] run scoreboard players reset @s SC

## 레녹스 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=lenoxskill] unless entity @s[tag=lenox] run tag @s remove lenoxskill
execute as @a[tag=lenoxcool] unless entity @s[tag=lenox] run tag @s remove lenoxcool
execute as @a[scores={lenoxskill=1..}] unless entity @s[tag=lenox] run scoreboard players reset @s lenoxskill

## 레녹스 태그 보유 시 팀 가입
execute as @a[tag=lenox,tag=team1] run team join lenox @s
execute as @a[tag=lenox,tag=team2] run team join lenox @s
execute as @a[tag=lenox,tag=team3] run team join lenox @s
execute as @a[tag=lenox,tag=team4] run team join lenox @s
execute as @a[tag=lenox,tag=team5] run team join lenox @s
execute as @a[tag=lenox,tag=team6] run team join lenox @s
execute as @a[tag=lenox,tag=team7] run team join lenox @s
execute as @a[tag=lenox,tag=team8] run team join lenox @s
execute as @a[tag=lenox,tag=team9] run team join lenox @s
execute as @a[tag=lenox,tag=team10] run team join lenox @s
execute as @a[tag=lenox,tag=team11] run team join lenox @s
execute as @a[tag=lenox,tag=team12] run team join lenox @s
execute as @a[tag=lenox,tag=team13] run team join lenox @s
execute as @a[tag=lenox,tag=team14] run team join lenox @s
execute as @a[tag=lenox,tag=team15] run team join lenox @s
execute as @a[tag=lenox,tag=team16] run team join lenox @s
execute as @a[tag=lenox,tag=team17] run team join lenox @s
execute as @a[tag=lenox,tag=team18] run team join lenox @s