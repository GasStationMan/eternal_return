## 레녹스 스킬 효과
execute if entity @s[tag=lenoxskill] run scoreboard players add @s lenoxskill 1
execute if entity @s[scores={lenoxskill=1}] run effect give @s absorption infinite 0 true
execute if entity @s[tag=lenoxskill] at @s run particle dust{color:[1.000,0.910,0.098],scale:1.5} ~ ~1 ~ 0.5 0.5 0.5 0.03 3 force

## 레녹스 스킬 효과 제거
execute if entity @s[scores={lenoxskill=40..}] run effect clear @s absorption
execute if entity @s[scores={lenoxskill=40..}] run tag @s remove lenoxskill
execute if entity @s[scores={lenoxskill=40..}] run scoreboard players reset @s lenoxskill

## 레녹스 스킬 쿨타임
execute if entity @s[tag=lenoxcool] run scoreboard players add @s SC 1
execute if entity @s[scores={SC=140}] run tellraw @s ["",{"text":"3초 후 패시브 스킬이 활성화 됩니다.","color":"yellow"}]
execute if entity @s[scores={SC=160}] run tellraw @s ["",{"text":"2초 후 패시브 스킬이 활성화 됩니다.","color":"yellow"}]
execute if entity @s[scores={SC=180}] run tellraw @s ["",{"text":"1초 후 패시브 스킬이 활성화 됩니다.","color":"yellow"}]
execute if entity @s[scores={SC=200}] run tellraw @s ["",{"text":"패시브 활성화!","color":"aqua"}]
execute if entity @s[scores={SC=200..}] run tag @s remove lenoxcool
execute if entity @s[scores={SC=200..}] run scoreboard players reset @s SC
