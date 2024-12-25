## 에스텔 패시브
execute if entity @s run effect give @s fire_resistance 1 10 true

## 게임 시작할 때 방패 획득
execute if entity @s if entity @e[tag=gametime,scores={gametime=1}] run item replace entity @s container.4 with shield[max_damage=1,damage=1] 1

## 방패 지급
execute if entity @s unless entity @s[nbt={Inventory:[{id:"minecraft:shield"}]}] run scoreboard players add @s sc 1
execute if entity @s[scores={sc=100..}] run give @s shield[max_damage=1,damage=1] 1
execute if entity @s[scores={sc=40}] run tellraw @s ["",{"text":"3초 후 [ 방패 ] 를 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={sc=60}] run tellraw @s ["",{"text":"2초 후 [ 방패 ] 를 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={sc=80}] run tellraw @s ["",{"text":"1초 후 [ 방패 ] 를 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={sc=100}] run tellraw @s ["",{"text":"[ 방패 ] 사용 가능!","color":"aqua"}]
execute if entity @s[scores={sc=100..}] run scoreboard players reset @s sc
execute if entity @s if entity @s[nbt={Inventory:[{id:"minecraft:shield"}]}] run scoreboard players reset @s sc

## 방패 F 방지
execute if entity @s[nbt={Inventory:[{id:"minecraft:shield",Slot:-106b}]}] run item replace entity @s weapon.mainhand from entity @s weapon.offhand
execute if entity @s[nbt={Inventory:[{id:"minecraft:shield",Slot:-106b}]}] run item replace entity @s weapon.offhand with air
execute if entity @s if score @s sc matches 1.. at @s as @e[limit=1,nbt={Item:{id:"minecraft:shield"}},distance=..2] run data merge entity @s {PickupDelay:0,Item:{}}

## 에스텔 태그 보유 시 팀 가입
team join estell @s[team=!estell]