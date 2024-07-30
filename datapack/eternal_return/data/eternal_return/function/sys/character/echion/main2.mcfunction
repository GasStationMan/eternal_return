## 우클릭 했을 때
execute if entity @s[scores={right=1..}] run tag @s add echionskill
execute if entity @s[scores={right=1..}] run tag @s add echioncool
execute if entity @s[scores={right=1..}] run item replace entity @s weapon.mainhand with barrier
execute if entity @s[scores={right=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute if entity @s[scores={right=1..}] at @s run function eternal_return:sys/character/particle/main

## 당근 낚싯대 F 방지
function eternal_return:sys/character/carrot_stick_f

## 에키온 스킬
function eternal_return:sys/character/echion/skill

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

## 에키온 태그 보유 시 팀 가입
team join echion @s[team=!echion]