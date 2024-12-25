## 카티야가 킬 했을 때
execute if entity @s[scores={katjakill=1..}] run tag @s add katjaskill
execute if entity @s[scores={katjakill=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute if entity @s[scores={katjakill=1..}] at @s run function eternal_return:sys/character/particle/main

## 스킬
function eternal_return:sys/character/katja/skill

## 카티야 태그 보유 시 팀 가입
team join katja @s[team=!katja]
