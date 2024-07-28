## 에스텔 패시브
execute as @a[tag=estell] run effect give @s fire_resistance 1 10 true

## 게임 시작할 때 방패 획득
execute as @a[tag=estell] if entity @e[tag=gametime,scores={gametime=1}] run item replace entity @s container.4 with shield[max_damage=1,damage=1] 1

## 방패 지급
execute as @a[tag=estell] unless entity @s[nbt={Inventory:[{id:"minecraft:shield"}]}] run scoreboard players add @s SC 1
execute as @a[tag=estell,scores={SC=100..}] run item replace entity @s container.4 with shield[max_damage=1,damage=1] 1
execute as @a[tag=estell,scores={SC=40}] run tellraw @s ["",{"text":"3초 후 [ 방패 ] 를 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=estell,scores={SC=60}] run tellraw @s ["",{"text":"2초 후 [ 방패 ] 를 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=estell,scores={SC=80}] run tellraw @s ["",{"text":"1초 후 [ 방패 ] 를 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=estell,scores={SC=100}] run tellraw @s ["",{"text":"[ 방패 ] 사용 가능!","color":"aqua"}]
execute as @a[tag=estell,scores={SC=100..}] run scoreboard players reset @s SC
execute as @a[tag=estell] if entity @s[nbt={Inventory:[{id:"minecraft:shield"}]}] run scoreboard players reset @s SC

## 방패 F 방지
execute as @a[nbt={Inventory:[{id:"minecraft:shield",Slot:-106b}]}] run item replace entity @s weapon.mainhand from entity @s weapon.offhand
execute as @a[nbt={Inventory:[{id:"minecraft:shield",Slot:-106b}]}] run item replace entity @s weapon.offhand with air

## 에스텔 태그 보유 시 팀 가입
execute as @a[tag=estell,tag=team1] run team join estell @s
execute as @a[tag=estell,tag=team2] run team join estell @s
execute as @a[tag=estell,tag=team3] run team join estell @s
execute as @a[tag=estell,tag=team4] run team join estell @s
execute as @a[tag=estell,tag=team5] run team join estell @s
execute as @a[tag=estell,tag=team6] run team join estell @s
execute as @a[tag=estell,tag=team7] run team join estell @s
execute as @a[tag=estell,tag=team8] run team join estell @s
execute as @a[tag=estell,tag=team9] run team join estell @s
execute as @a[tag=estell,tag=team10] run team join estell @s
execute as @a[tag=estell,tag=team11] run team join estell @s
execute as @a[tag=estell,tag=team12] run team join estell @s
execute as @a[tag=estell,tag=team13] run team join estell @s
execute as @a[tag=estell,tag=team14] run team join estell @s
execute as @a[tag=estell,tag=team15] run team join estell @s
execute as @a[tag=estell,tag=team16] run team join estell @s
execute as @a[tag=estell,tag=team17] run team join estell @s
execute as @a[tag=estell,tag=team18] run team join estell @s
