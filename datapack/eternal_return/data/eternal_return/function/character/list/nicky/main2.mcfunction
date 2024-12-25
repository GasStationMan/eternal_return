## 니키 피 없을 때
execute if entity @s[scores={hp=..8}] run tag @s add nickyskill
execute if entity @s[tag=nickyskill] run scoreboard players add @s nickyskill 1
execute if entity @s[scores={nickyskill=1}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2
execute if entity @s[scores={hp=9..}] run tag @s remove nickyskill

## 스킬 사용 이펙트
execute if entity @s[scores={nickyskill=1}] at @s run function eternal_return:sys/character/particle/main

## 니키 스킬 효과
execute if entity @s[tag=nickyskill] run effect give @s strength 1 0 true
execute if entity @s[tag=nickyskill] at @s run particle minecraft:angry_villager ~ ~ ~ 0.3 0.3 0.3 0.1 1 force
execute if entity @s unless entity @s[tag=nickyskill] run scoreboard players reset @s nickyskill

## 니키 태그 보유 시 팀 가입
team join nicky @s[team=!nicky]