## 재키가 킬 했을 때
execute if entity @s[scores={jackiekill=1..}] run tag @s add jackieskill
execute if entity @s[scores={jackiekill=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute if entity @s[scores={jackiekill=1..}] at @s run function eternal_return:sys/character/particle/main

## 재키 스킬 효과
execute if entity @s[tag=jackieskill] run scoreboard players add @s jackieskill 1
execute if entity @s[tag=jackieskill] run effect give @s strength 1 1 true
execute if entity @s[tag=jackieskill] at @s run particle minecraft:crimson_spore ~ ~1 ~ 0 0 0 0 5 force
execute if entity @s[tag=jackieskill] at @s run particle dust{color:[0.702,0.000,0.000],scale:1} ~ ~1 ~ 0.3 0.3 0.3 0 5 force

## 재키 스킬 중 킬 했을 때 지속시간 초기화
execute if entity @s[tag=jackieskill,scores={jackiekill=1..}] run scoreboard players set @s jackieskill 0

## 재키 스킬 효과 제거
execute if entity @s[tag=jackieskill,scores={jackieskill=100..}] run effect clear @s strength
execute if entity @s[tag=jackieskill,scores={jackieskill=100..}] run tag @s remove jackieskill
execute if entity @s[scores={jackieskill=100..}] run scoreboard players reset @s jackieskill
execute if entity @s[scores={jackiekill=1..}] run scoreboard players reset @s jackiekill

## 재키 태그 보유 시 팀 가입
team join jackie @s[team=!jackie]
