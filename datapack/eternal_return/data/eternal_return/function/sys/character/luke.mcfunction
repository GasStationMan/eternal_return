## 루크가 킬 했을 때
execute as @a[tag=luke,scores={lukekill=1..}] run tag @s add lukeskill
execute as @a[tag=luke,scores={lukekill=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute as @a[tag=luke,scores={lukekill=1..}] at @s run function eternal_return:sys/character/particle/main

## 루크 스킬 효과
execute as @a[tag=luke,tag=lukeskill] run effect give @s instant_health 1 10 true
execute as @a[tag=luke,tag=lukeskill] at @s run particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0.1 15 force
execute as @a[tag=luke,tag=lukeskill] run tag @s remove lukeskill

## 루크 태그 제거 했을 때 관련 태그 제거
execute as @a[scores={lukekill=1..}] run scoreboard players reset @s lukekill
execute as @a[tag=lukeskill] unless entity @s[tag=luke] run tag @s remove lukeskill
execute as @a[scores={lukeskill=1..}] unless entity @s[tag=luke] run scoreboard players reset @s lukeskill

## 루크 태그 보유 시 팀 가입
execute as @a[tag=luke,tag=team1] run team join luke @s
execute as @a[tag=luke,tag=team2] run team join luke @s
execute as @a[tag=luke,tag=team3] run team join luke @s
execute as @a[tag=luke,tag=team4] run team join luke @s
execute as @a[tag=luke,tag=team5] run team join luke @s
execute as @a[tag=luke,tag=team6] run team join luke @s
execute as @a[tag=luke,tag=team7] run team join luke @s
execute as @a[tag=luke,tag=team8] run team join luke @s
execute as @a[tag=luke,tag=team9] run team join luke @s
execute as @a[tag=luke,tag=team10] run team join luke @s
execute as @a[tag=luke,tag=team11] run team join luke @s
execute as @a[tag=luke,tag=team12] run team join luke @s
execute as @a[tag=luke,tag=team13] run team join luke @s
execute as @a[tag=luke,tag=team14] run team join luke @s
execute as @a[tag=luke,tag=team15] run team join luke @s
execute as @a[tag=luke,tag=team16] run team join luke @s
execute as @a[tag=luke,tag=team17] run team join luke @s
execute as @a[tag=luke,tag=team18] run team join luke @s

