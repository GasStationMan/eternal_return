## 피올로 피 없을 때
execute if entity @s[tag=rest] run scoreboard players add @s pioloskill 1

## 스킬 사용 이펙트
execute if entity @s[scores={pioloskill=39}] at @s run function eternal_return:sys/character/particle/main
execute if entity @s[scores={pioloskill=39}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 피올로 스킬 효과
execute if score @s pioloskill matches 40.. run tag @s add pioloskill
execute if score @s pioloskill matches 40.. run scoreboard players set @s pioloskill 40
execute if entity @s[tag=pioloskill] run effect give @s strength infinite 0 true

## 피올로 스킬 효과 제거
execute if entity @s[tag=pioloskill] if score @s dmggive matches 0.. run effect clear @s strength
execute if entity @s[tag=pioloskill] if score @s dmggive matches 0.. run tag @s remove pioloskill
execute if entity @s unless entity @s[tag=rest] run scoreboard players reset @s pioloskill


## 피올로 태그 보유 시 팀 가입
team join piolo @s[team=!piolo]