## 루크가 킬 했을 때
execute if entity @s[scores={lukekill=1..}] run tag @s add lukeskill
execute if entity @s[scores={lukekill=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute if entity @s[scores={lukekill=1..}] at @s run function eternal_return:sys/character/particle/main

## 루크 스킬 효과
execute if entity @s[tag=lukeskill] run effect give @s instant_health 1 10 true
execute if entity @s[tag=lukeskill] at @s run particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0.1 15 force
execute if entity @s[tag=lukeskill] run tag @s remove lukeskill

## 루크 태그 제거 했을 때 관련 태그 제거
execute if entity @s[scores={lukekill=1..}] run scoreboard players reset @s lukekill
execute if entity @s[tag=lukeskill] unless entity @s[tag=luke] run tag @s remove lukeskill

## 루크 태그 보유 시 팀 가입
team join luke @s[team=!luke]