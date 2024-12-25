## 레녹스가 때렸을 때
execute if entity @s[scores={dmggive=0..},tag=!lenoxcool] run tag @s add lenoxskill
execute if entity @s[scores={dmggive=0..},tag=!lenoxcool] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2
execute if entity @s[scores={dmggive=0..}] run tag @s add lenoxcool

## 스킬 사용 이펙트
execute if entity @s[scores={dmggive=0..},tag=!lenoxcool] at @s run function eternal_return:sys/character/particle/main

## 스킬
function eternal_return:sys/character/lenox/skill

## 레녹스 태그 보유 시 팀 가입
team join lenox @s[team=!lenox]