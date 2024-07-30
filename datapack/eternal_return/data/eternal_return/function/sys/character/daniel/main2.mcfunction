## 밤이 됐을 때
execute if score #timer.halfday CT1 matches 2 \
    if score #timer.sec CT1 matches 0 \
    if score #timer.tick CT1 matches 19 \
        run tag @s add danielskill
execute if score #timer.halfday CT1 matches 1 \
    if score #timer.sec CT1 matches 0 \
    if score #timer.tick CT1 matches 19 \
        at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute if score #game.daycycle.tick CT1 matches 2 if score #timer.halfday CT1 matches 1 at @s run function eternal_return:sys/character/particle/main

## 다니엘 스킬 효과
execute if entity @s[tag=danielskill] at @s run effect give @s speed 1 0 true
execute if entity @s[tag=danielskill] at @s run effect give @s strength 1 0 true

## 낮이 됐을 때 스킬 효과 제거
execute if score #game.daycycle.tick CT1 matches 2 if score #timer.halfday CT1 matches 2 run tag @s remove danielskill
execute if score #game.daycycle.tick CT1 matches 2 if score #timer.halfday CT1 matches 2 run effect clear @s speed
execute if score #game.daycycle.tick CT1 matches 2 if score #timer.halfday CT1 matches 2 run effect clear @s strength
execute if score #game.daycycle.tick CT1 matches 2 if score #timer.halfday CT1 matches 2 run scoreboard players reset @s danielskill

## 다니엘 태그 보유 시 팀 가입
team join daniel @s[team=!daniel]