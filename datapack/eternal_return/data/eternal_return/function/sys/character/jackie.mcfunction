## 재키가 킬 했을 때
execute as @a[tag=jackie,scores={jackiekill=1..}] run tag @s add jackieskill
execute as @a[tag=jackie,scores={jackiekill=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute as @a[tag=jackie,scores={jackiekill=1..}] at @s run function eternal_return:sys/character/particle/main

## 재키 스킬 효과
execute as @a[tag=jackie,tag=jackieskill] run scoreboard players add @s jackieskill 1
execute as @a[tag=jackie,tag=jackieskill] run effect give @s strength 1 1 true
execute as @a[tag=jackie,tag=jackieskill] at @s run particle minecraft:crimson_spore ~ ~1 ~ 0 0 0 0 5 force
execute as @a[tag=jackie,tag=jackieskill] at @s run particle dust{color:[0.702,0.000,0.000],scale:1} ~ ~1 ~ 0.3 0.3 0.3 0 5 force

## 재키 스킬 중 킬 했을 때 지속시간 초기화
execute as @a[tag=jackie,tag=jackieskill,scores={jackiekill=1..}] run scoreboard players set @s jackieskill 0

## 재키 스킬 효과 제거
execute as @a[tag=jackie,tag=jackieskill,scores={jackieskill=100..}] run effect clear @s strength
execute as @a[tag=jackie,tag=jackieskill,scores={jackieskill=100..}] run tag @s remove jackieskill
execute as @a[tag=jackie,scores={jackieskill=100..}] run scoreboard players reset @s jackieskill
execute as @a[scores={jackiekill=1..}] run scoreboard players reset @s jackiekill

## 재키 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=jackieskill] unless entity @s[tag=jackie] run tag @s remove jackieskill
execute as @a[scores={jackieskill=1..}] unless entity @s[tag=jackie] run scoreboard players reset @s jackieskill

## 재키 태그 보유 시 팀 가입
execute as @a[tag=jackie,tag=team1] run team join jackie @s
execute as @a[tag=jackie,tag=team2] run team join jackie @s
execute as @a[tag=jackie,tag=team3] run team join jackie @s
execute as @a[tag=jackie,tag=team4] run team join jackie @s
execute as @a[tag=jackie,tag=team5] run team join jackie @s
execute as @a[tag=jackie,tag=team6] run team join jackie @s
execute as @a[tag=jackie,tag=team7] run team join jackie @s
execute as @a[tag=jackie,tag=team8] run team join jackie @s
execute as @a[tag=jackie,tag=team9] run team join jackie @s
execute as @a[tag=jackie,tag=team10] run team join jackie @s
execute as @a[tag=jackie,tag=team11] run team join jackie @s
execute as @a[tag=jackie,tag=team12] run team join jackie @s
execute as @a[tag=jackie,tag=team13] run team join jackie @s
execute as @a[tag=jackie,tag=team14] run team join jackie @s
execute as @a[tag=jackie,tag=team15] run team join jackie @s
execute as @a[tag=jackie,tag=team16] run team join jackie @s
execute as @a[tag=jackie,tag=team17] run team join jackie @s
execute as @a[tag=jackie,tag=team18] run team join jackie @s
