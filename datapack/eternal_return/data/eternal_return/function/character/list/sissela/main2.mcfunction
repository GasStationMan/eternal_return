## 시셀라 피 없을 때
execute if entity @s[scores={hp=..9}] run tag @s add sisselaskill
execute if entity @s[tag=sisselaskill] run scoreboard players add @s sisselaskill 1
execute if entity @s[scores={sisselaskill=1}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2
execute if entity @s[scores={hp=10..}] run tag @s remove sisselaskill

## 스킬 사용 이펙트
execute if entity @s[scores={sisselaskill=1}] at @s run function eternal_return:sys/character/particle/main

## 시셀라 스킬 효과
execute if entity @s[tag=sisselaskill] run effect give @s regeneration infinite 0 true
execute if entity @s[tag=sisselaskill] at @s run particle minecraft:happy_villager ~ ~ ~ 0.3 0.3 0.3 0.1 1 force

## 시셀라 스킬 효과 제거
execute if entity @s[tag=!sisselaskill] run effect clear @s regeneration
execute if entity @s unless entity @s[tag=sisselaskill] run scoreboard players reset @s sisselaskill

## 시셀라 태그 보유 시 팀 가입
team join sissela @s[team=!sissela]