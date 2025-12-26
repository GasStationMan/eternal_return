## 우클릭 했을 때
execute if entity @s[scores={right=1..}] run tag @s add viancaskill
execute if entity @s[scores={right=1..}] run tag @s add viancacool
execute if entity @s[scores={right=1..}] run item replace entity @s weapon.mainhand with barrier
execute if entity @s[scores={right=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2
execute if entity @s[scores={right=1..}] at @s run tp @s ~ ~ ~ ~ 0

## 스킬 사용 이펙트
execute if entity @s[scores={right=1..}] at @s run function eternal_return:sys/character/particle/main

## 당근 낚싯대 F 방지
function eternal_return:sys/character/carrot_stick_f

## 비앙카 위치 고정용 마커 소환
execute if entity @s[tag=viancaskill] run scoreboard players add @s viancaskill 1
execute if entity @s[scores={viancaskill=1}] at @s run summon minecraft:marker ^ ^ ^-0.0001 {Tags:["viancaw"]}
execute if entity @s[scores={viancaskill=1}] at @s run summon block_display ~-0.5 ~ ~-0.5 {Tags:["viancaw1"],block_state:{Name:"minecraft:crimson_hyphae"}}
execute if entity @s[scores={viancaskill=1}] at @s run summon block_display ~-0.5 ~1 ~-0.5 {Tags:["viancaw1"],block_state:{Name:"minecraft:crimson_hyphae"}}
execute as @e[tag=viancaskill] at @s run particle minecraft:dust{color:[0.65,0.00,0.00],scale:1} ~ ~1 ~ 0.5 0.5 0.5 0.05 10

## 비앙카를 마커에 tp
execute if entity @a[scores={viancaskill=1}] as @e[tag=viancaw] at @s run tp @s ~ ~ ~ facing entity @a[tag=viancaskill,limit=1,sort=nearest]
execute if entity @s[tag=viancaskill] at @s run tp @s @e[tag=viancaw,limit=1,sort=nearest]

## 비앙카 스킬 효과
execute if entity @s[tag=viancaskill] run effect give @s regeneration infinite 3 true
execute if entity @s[tag=viancaskill] run effect give @s resistance infinite 2 true
execute if entity @s[tag=viancaskill] run effect give @s weakness infinite 100 true

## 비앙카 스킬 효과 제거
execute if entity @s[scores={viancaskill=100..}] run effect clear @s regeneration
execute if entity @s[scores={viancaskill=100..}] run effect clear @s resistance
execute if entity @s[scores={viancaskill=100..}] run effect clear @s weakness
execute if entity @s[scores={viancaskill=100..}] at @s run kill @e[tag=viancaw,limit=1,sort=nearest]
execute if entity @s[scores={viancaskill=100..}] at @s run kill @e[tag=viancaw1,limit=2,sort=nearest]
execute if entity @s[scores={viancaskill=100..}] run tag @s remove viancaskill
execute if entity @s[scores={viancaskill=100..}] run scoreboard players reset @s viancaskill

## 비앙카 스킬 쿨타임
execute if entity @s[tag=viancacool] run scoreboard players add @s sc 1
execute if entity @s[scores={sc=200}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={sc=220}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={sc=240}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={sc=260}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute if entity @s[scores={sc=260..}] run clear @s barrier
execute if entity @s[scores={sc=260..}] run tag @s remove viancacool
execute if entity @s[scores={sc=260..}] run scoreboard players reset @s sc

## 스킬 아이템 위치 고정
execute if entity @s unless score @s sc matches 1.. at @s if items entity @s player.cursor minecraft:carrot_on_a_stick run item replace entity @s player.cursor with air
execute if entity @s[nbt=!{Inventory:[{Slot:4b}]}] unless score @s sc matches 1.. run clear @s minecraft:carrot_on_a_stick
execute if entity @s[nbt=!{Inventory:[{Slot:4b}]}] unless score @s sc matches 1.. run item replace entity @s container.4 with minecraft:carrot_on_a_stick
execute if entity @s[nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:4b}]}] unless score @s sc matches 1.. run clear @s minecraft:carrot_on_a_stick
execute if entity @s[nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick"}]}] unless score @s sc matches 1.. run clear @s minecraft:carrot_on_a_stick
execute if entity @s unless score @s sc matches 1.. at @s run kill @e[distance=..2,limit=1,nbt={Item:{id:"minecraft:carrot_on_a_stick"}}]

execute if entity @s if score @s sc matches 1.. at @s if items entity @s player.cursor minecraft:barrier run item replace entity @s player.cursor with air
execute if entity @s[nbt=!{Inventory:[{Slot:4b}]}] if score @s sc matches 1.. run clear @s minecraft:barrier
execute if entity @s[nbt=!{Inventory:[{Slot:4b}]}] if score @s sc matches 1.. run item replace entity @s container.4 with minecraft:barrier
execute if entity @s[nbt=!{Inventory:[{id:"minecraft:barrier",Slot:4b}]}] if score @s sc matches 1.. run clear @s minecraft:barrier
execute if entity @s[nbt=!{Inventory:[{id:"minecraft:barrier"}]}] if score @s sc matches 1.. run clear @s minecraft:barrier
execute if entity @s if score @s sc matches 1.. at @s run kill @e[distance=..2,limit=1,nbt={Item:{id:"minecraft:barrier"}}]

## 비앙카 태그 보유 시 팀 가입
team join vianca @s[team=!vianca]