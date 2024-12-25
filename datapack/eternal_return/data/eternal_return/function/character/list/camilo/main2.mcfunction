## 스킬 사용 이펙트
execute if entity @s[scores={dmggive=0..},tag=!camilocool] at @s run function eternal_return:sys/character/particle/main

## 카밀로가 때렸을 때
execute if entity @s[scores={dmggive=0..},tag=!camilocool] run tag @s add camiloskill
execute if entity @s[scores={dmggive=0..},tag=!camilocool] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2
execute if entity @s[scores={dmggive=0..}] run tag @s add camilocool

## 스킬
function eternal_return:sys/character/camilo/skill

## 카밀로 태그 보유 시 팀 가입
team join camilo @s[team=!camilo]