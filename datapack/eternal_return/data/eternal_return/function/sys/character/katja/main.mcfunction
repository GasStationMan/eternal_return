## 카티야가 킬 했을 때
execute as @a[tag=katja,scores={katjakill=1..}] run tag @s add katjaskill
execute as @a[tag=katja,scores={katjakill=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute as @a[tag=katja,scores={katjakill=1..}] at @s run function eternal_return:sys/character/particle/main

## 카티야 스킬 효과
execute as @a[tag=katja,tag=katjaskill] run scoreboard players add @s credit 50

## 카티야 스킬 효과 제거
execute as @a[tag=katjaskill] run tag @s remove katjaskill
execute as @a[scores={katjakill=1..}] run scoreboard players reset @s katjakill

## 카티야 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=katjaskill] unless entity @s[tag=katja] run tag @s remove katjaskill
execute as @a[scores={katjaskill=1..}] unless entity @s[tag=katja] run scoreboard players reset @s katjaskill

## 카티야 태그 보유 시 팀 가입
execute as @a[tag=katja,tag=team1] run team join katja @s
execute as @a[tag=katja,tag=team2] run team join katja @s
execute as @a[tag=katja,tag=team3] run team join katja @s
execute as @a[tag=katja,tag=team4] run team join katja @s
execute as @a[tag=katja,tag=team5] run team join katja @s
execute as @a[tag=katja,tag=team6] run team join katja @s
execute as @a[tag=katja,tag=team7] run team join katja @s
execute as @a[tag=katja,tag=team8] run team join katja @s
execute as @a[tag=katja,tag=team9] run team join katja @s
execute as @a[tag=katja,tag=team10] run team join katja @s
execute as @a[tag=katja,tag=team11] run team join katja @s
execute as @a[tag=katja,tag=team12] run team join katja @s
execute as @a[tag=katja,tag=team13] run team join katja @s
execute as @a[tag=katja,tag=team14] run team join katja @s
execute as @a[tag=katja,tag=team15] run team join katja @s
execute as @a[tag=katja,tag=team16] run team join katja @s
execute as @a[tag=katja,tag=team17] run team join katja @s
execute as @a[tag=katja,tag=team18] run team join katja @s
