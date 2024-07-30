## 우클릭 했을 때
execute if entity @s[scores={right=1..}] run tag @s add yohanskill
execute if entity @s[scores={right=1..}] run tag @s add yohancool
execute if entity @s[scores={right=1..}] run item replace entity @s weapon.mainhand with barrier
execute if entity @s[scores={right=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute if entity @s[scores={right=1..}] at @s run function eternal_return:sys/character/particle/main

## 당근 낚싯대 F 방지
function eternal_return:sys/character/carrot_stick_f

## 요한 스킬 효과
execute if entity @s[tag=yohanskill] run effect give @s regeneration infinite 4 true
execute if entity @s[tag=yohanskill] run effect give @s slowness infinite 4 true
execute if entity @s[tag=yohanskill] run effect give @s weakness infinite 100 true
execute if entity @s[tag=yohanskill] at @s run particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0.1 5 force
execute if entity @s[tag=yohanskill] run scoreboard players add @s yohanskill 1

## 요한 스킬 효과 제거
execute if entity @s[scores={yohanskill=60..}] run effect clear @s regeneration
execute if entity @s[scores={yohanskill=60..}] run effect clear @s slowness
execute if entity @s[scores={yohanskill=60..}] run effect clear @s weakness
execute if entity @s[scores={yohanskill=60..}] run tag @s remove yohanskill
execute if entity @s[scores={yohanskill=60..}] run scoreboard players reset @s yohanskill

## 요한 스킬 쿨타임
execute if entity @s[tag=yohancool] run scoreboard players add @s SC 1
execute if entity @s[scores={SC=540}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=560}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=580}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=600}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute if entity @s[scores={SC=600..}] run clear @s barrier
execute if entity @s[scores={SC=600..}] run tag @s remove yohancool
execute if entity @s[scores={SC=600..}] run scoreboard players reset @s SC

## 스킬 아이템 위치 고정
execute if entity @s unless score @s SC matches 1.. at @s if items entity @s player.cursor minecraft:carrot_on_a_stick run item replace entity @s player.cursor with air
execute if entity @s[nbt=!{Inventory:[{Slot:4b}]}] unless score @s SC matches 1.. run clear @s minecraft:carrot_on_a_stick
execute if entity @s[nbt=!{Inventory:[{Slot:4b}]}] unless score @s SC matches 1.. run item replace entity @s container.4 with minecraft:carrot_on_a_stick
execute if entity @s[nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:4b}]}] unless score @s SC matches 1.. run clear @s minecraft:carrot_on_a_stick
execute if entity @s[nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick"}]}] unless score @s SC matches 1.. run clear @s minecraft:carrot_on_a_stick
execute if entity @s unless score @s SC matches 1.. at @s run kill @e[distance=..2,limit=1,nbt={Item:{id:"minecraft:carrot_on_a_stick"}}]

execute if entity @s if score @s SC matches 1.. at @s if items entity @s player.cursor minecraft:barrier run item replace entity @s player.cursor with air
execute if entity @s[nbt=!{Inventory:[{Slot:4b}]}] if score @s SC matches 1.. run clear @s minecraft:barrier
execute if entity @s[nbt=!{Inventory:[{Slot:4b}]}] if score @s SC matches 1.. run item replace entity @s container.4 with minecraft:barrier
execute if entity @s[nbt=!{Inventory:[{id:"minecraft:barrier",Slot:4b}]}] if score @s SC matches 1.. run clear @s minecraft:barrier
execute if entity @s[nbt=!{Inventory:[{id:"minecraft:barrier"}]}] if score @s SC matches 1.. run clear @s minecraft:barrier
execute if entity @s if score @s SC matches 1.. at @s run kill @e[distance=..2,limit=1,nbt={Item:{id:"minecraft:barrier"}}]

## 요한 태그 보유 시 팀 가입
team join yohan @s[team=!yohan]