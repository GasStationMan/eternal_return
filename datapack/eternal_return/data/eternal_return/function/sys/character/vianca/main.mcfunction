## 우클릭 했을 때
execute as @a[tag=vianca,scores={right=1..}] run tag @s add viancaskill
execute as @a[tag=vianca,scores={right=1..}] run tag @s add viancacool
execute as @a[tag=vianca,scores={right=1..}] run item replace entity @s weapon.mainhand with barrier
execute as @a[tag=vianca,scores={right=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2
execute as @a[tag=vianca,scores={right=1..}] at @s run tp @s ~ ~ ~ ~ 0

## 스킬 사용 이펙트
execute as @a[tag=vianca,scores={right=1..}] at @s run function eternal_return:sys/character/particle/main

## 당근 낚싯대 F 방지
function eternal_return:sys/character/carrot_stick_f

## 비앙카 위치 고정용 마커 소환
execute as @a[tag=viancaskill] run scoreboard players add @s viancaskill 1
execute as @a[scores={viancaskill=1}] at @s run summon minecraft:marker ^ ^ ^-0.0001 {Tags:["viancaw"]}
execute as @a[scores={viancaskill=1}] at @s run summon block_display ~-0.5 ~ ~-0.5 {Tags:["viancaw1"],block_state:{Name:"minecraft:crimson_hyphae"}}
execute as @a[scores={viancaskill=1}] at @s run summon block_display ~-0.5 ~1 ~-0.5 {Tags:["viancaw1"],block_state:{Name:"minecraft:crimson_hyphae"}}
execute as @e[tag=viancaskill] at @s run particle minecraft:dust{color:[0.65,0.00,0.00],scale:1} ~ ~1 ~ 0.5 0.5 0.5 0.05 10

## 비앙카를 마커에 tp
execute if entity @a[scores={viancaskill=1}] as @e[tag=viancaw] at @s run tp @s ~ ~ ~ facing entity @a[tag=viancaskill,limit=1,sort=nearest]
execute as @a[tag=viancaskill] at @s run tp @s @e[tag=viancaw,limit=1,sort=nearest]

## 비앙카 스킬 효과
execute as @a[tag=viancaskill] run effect give @s regeneration infinite 3 true
execute as @a[tag=viancaskill] run effect give @s resistance infinite 2 true
execute as @a[tag=viancaskill] run effect give @s weakness infinite 100 true

## 비앙카 스킬 효과 제거
execute as @a[scores={viancaskill=100..}] run effect clear @s regeneration
execute as @a[scores={viancaskill=100..}] run effect clear @s resistance
execute as @a[scores={viancaskill=100..}] run effect clear @s weakness
execute as @a[scores={viancaskill=100..}] at @s run kill @e[tag=viancaw,limit=1,sort=nearest]
execute as @a[scores={viancaskill=100..}] at @s run kill @e[tag=viancaw1,limit=2,sort=nearest]
execute as @a[scores={viancaskill=100..}] run tag @s remove viancaskill
execute as @a[scores={viancaskill=100..}] run scoreboard players reset @s viancaskill

## 비앙카 스킬 쿨타임
execute as @a[tag=viancacool] run scoreboard players add @s SC 1
execute as @a[tag=vianca,scores={SC=200}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=vianca,scores={SC=220}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=vianca,scores={SC=240}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=vianca,scores={SC=260}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute as @a[tag=vianca,scores={SC=260..}] run item replace entity @s container.4 with carrot_on_a_stick
execute as @a[tag=vianca,scores={SC=260..}] run tag @s remove viancacool
execute as @a[tag=vianca,scores={SC=260..}] run scoreboard players reset @s SC

## 비앙카 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=viancaskill] unless entity @s[tag=vianca] run tag @s remove viancaskill
execute as @a[tag=viancacool] unless entity @s[tag=vianca] run tag @s remove viancacool
execute as @a[scores={viancaskill=1..}] unless entity @s[tag=vianca] run scoreboard players reset @s viancaskill

## 비앙카 태그 보유 시 팀 가입
execute as @a[tag=vianca,tag=team1] run team join vianca @s
execute as @a[tag=vianca,tag=team2] run team join vianca @s
execute as @a[tag=vianca,tag=team3] run team join vianca @s
execute as @a[tag=vianca,tag=team4] run team join vianca @s
execute as @a[tag=vianca,tag=team5] run team join vianca @s
execute as @a[tag=vianca,tag=team6] run team join vianca @s
execute as @a[tag=vianca,tag=team7] run team join vianca @s
execute as @a[tag=vianca,tag=team8] run team join vianca @s
execute as @a[tag=vianca,tag=team9] run team join vianca @s
execute as @a[tag=vianca,tag=team10] run team join vianca @s
execute as @a[tag=vianca,tag=team11] run team join vianca @s
execute as @a[tag=vianca,tag=team12] run team join vianca @s
execute as @a[tag=vianca,tag=team13] run team join vianca @s
execute as @a[tag=vianca,tag=team14] run team join vianca @s
execute as @a[tag=vianca,tag=team15] run team join vianca @s
execute as @a[tag=vianca,tag=team16] run team join vianca @s
execute as @a[tag=vianca,tag=team17] run team join vianca @s
execute as @a[tag=vianca,tag=team18] run team join vianca @s