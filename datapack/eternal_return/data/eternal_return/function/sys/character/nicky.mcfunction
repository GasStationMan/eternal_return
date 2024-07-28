## 니키 피 없을 때
execute as @a[tag=nicky,scores={hp=..8}] run tag @s add nickyskill
execute as @a[tag=nickyskill] run scoreboard players add @s nickyskill 1
execute as @a[scores={nickyskill=1}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2
execute as @a[tag=nicky,scores={hp=9..}] run tag @s remove nickyskill

## 스킬 사용 이펙트
execute as @a[scores={nickyskill=1}] at @s run function eternal_return:sys/character/particle/main

## 니키 스킬 효과
execute as @a[tag=nickyskill] run effect give @s strength 1 0 true
execute as @a[tag=nickyskill] at @s run particle minecraft:angry_villager ~ ~ ~ 0.3 0.3 0.3 0.1 1 force

## 니키 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=nicky] unless entity @s[tag=nickyskill] run scoreboard players reset @s nickyskill
execute as @a[tag=nickyskill] unless entity @s[tag=nicky] run tag @s remove nickyskill

## 니키 태그 보유 시 팀 가입
execute as @a[tag=nicky,tag=team1] run team join nicky @s
execute as @a[tag=nicky,tag=team2] run team join nicky @s
execute as @a[tag=nicky,tag=team3] run team join nicky @s
execute as @a[tag=nicky,tag=team4] run team join nicky @s
execute as @a[tag=nicky,tag=team5] run team join nicky @s
execute as @a[tag=nicky,tag=team6] run team join nicky @s
execute as @a[tag=nicky,tag=team7] run team join nicky @s
execute as @a[tag=nicky,tag=team8] run team join nicky @s
execute as @a[tag=nicky,tag=team9] run team join nicky @s
execute as @a[tag=nicky,tag=team10] run team join nicky @s
execute as @a[tag=nicky,tag=team11] run team join nicky @s
execute as @a[tag=nicky,tag=team12] run team join nicky @s
execute as @a[tag=nicky,tag=team13] run team join nicky @s
execute as @a[tag=nicky,tag=team14] run team join nicky @s
execute as @a[tag=nicky,tag=team15] run team join nicky @s
execute as @a[tag=nicky,tag=team16] run team join nicky @s
execute as @a[tag=nicky,tag=team17] run team join nicky @s
execute as @a[tag=nicky,tag=team18] run team join nicky @s