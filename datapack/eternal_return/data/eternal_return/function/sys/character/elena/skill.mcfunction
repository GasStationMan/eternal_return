## 엘레나 스킬 효과
execute if entity @s[tag=elenaskill] at @s run particle item{item:"blue_ice"} ~ ~ ~ 1.5 0 1.5 0 200 force

function eternal_return:sys/character/elena/enemytag

execute as @e[tag=elenaskill1] at @s run effect give @s slowness 2 1 true
execute as @e[tag=elenaskill1] at @s run particle dust{color:[0.388,1.000,0.980],scale:1} ~ ~ ~ 0.5 0 0.5 0 70 force
execute as @e[tag=elenaskill1] run tag @s remove elenaskill1

## 엘레나 스킬 태그 제거
tag @a[tag=elenaskill] remove elenaskill

## 엘레나 스킬 쿨타임
execute if entity @s[tag=elenacool] run scoreboard players add @s SC 1
execute if entity @s[scores={SC=140}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=160}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=180}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=200}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute if entity @s[scores={SC=200..}] run clear @s barrier
execute if entity @s[scores={SC=200..}] run tag @s remove elenacool
execute if entity @s[scores={SC=200..}] run scoreboard players reset @s SC
