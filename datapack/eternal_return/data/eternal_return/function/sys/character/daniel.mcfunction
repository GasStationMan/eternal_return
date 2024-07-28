## 밤이 됐을 때
execute as @a[tag=daniel] if entity @e[tag=gametime,scores={bosstime=1},limit=1] if score daycycle daycycle matches 1 run tag @s add danielskill
execute as @a[tag=danielskill] run scoreboard players add @s danielskill 1
execute as @a[scores={danielskill=1}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute as @a[tag=daniel,scores={danielskill=1}] at @s run function eternal_return:sys/character/particle/main

## 다니엘 스킬 효과
execute as @a[tag=danielskill] at @s run effect give @s speed infinite 0 true
execute as @a[tag=danielskill] at @s run effect give @s strength infinite 0 true

## 낮이 됐을 때 스킬 효과 제거
execute as @a[tag=daniel] if entity @e[tag=gametime,scores={bosstime=1},limit=1] if score daycycle daycycle matches 0 run tag @s remove danielskill
execute as @a[tag=daniel] if entity @e[tag=gametime,scores={bosstime=1},limit=1] if score daycycle daycycle matches 0 run effect clear @s speed
execute as @a[tag=daniel] if entity @e[tag=gametime,scores={bosstime=1},limit=1] if score daycycle daycycle matches 0 run effect clear @s strength
execute as @a[tag=daniel] if entity @e[tag=gametime,scores={bosstime=1},limit=1] if score daycycle daycycle matches 0 run scoreboard players reset @s danielskill

## 게임 종료 (낮)일 때 스킬 효과 제거
execute as @a[tag=daniel] unless entity @e[tag=gametime] if score daycycle daycycle matches 0 run tag @s remove danielskill
execute as @a[tag=daniel] unless entity @e[tag=gametime] if score daycycle daycycle matches 0 run effect clear @s speed
execute as @a[tag=daniel] unless entity @e[tag=gametime] if score daycycle daycycle matches 0 run effect clear @s strength
execute as @a[tag=daniel] unless entity @e[tag=gametime] if score daycycle daycycle matches 0 run scoreboard players reset @s danielskill

## 다니엘 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=danielskill] unless entity @s[tag=daniel] run tag @s remove danielskill
execute as @a[scores={danielskill=1..}] unless entity @s[tag=daniel] run scoreboard players reset @s danielskill

## 다니엘 태그 보유 시 팀 가입
execute as @a[tag=daniel,tag=team1] run team join daniel @s
execute as @a[tag=daniel,tag=team2] run team join daniel @s
execute as @a[tag=daniel,tag=team3] run team join daniel @s
execute as @a[tag=daniel,tag=team4] run team join daniel @s
execute as @a[tag=daniel,tag=team5] run team join daniel @s
execute as @a[tag=daniel,tag=team6] run team join daniel @s
execute as @a[tag=daniel,tag=team7] run team join daniel @s
execute as @a[tag=daniel,tag=team8] run team join daniel @s
execute as @a[tag=daniel,tag=team9] run team join daniel @s
execute as @a[tag=daniel,tag=team10] run team join daniel @s
execute as @a[tag=daniel,tag=team11] run team join daniel @s
execute as @a[tag=daniel,tag=team12] run team join daniel @s
execute as @a[tag=daniel,tag=team13] run team join daniel @s
execute as @a[tag=daniel,tag=team14] run team join daniel @s
execute as @a[tag=daniel,tag=team15] run team join daniel @s
execute as @a[tag=daniel,tag=team16] run team join daniel @s
execute as @a[tag=daniel,tag=team17] run team join daniel @s
execute as @a[tag=daniel,tag=team18] run team join daniel @s