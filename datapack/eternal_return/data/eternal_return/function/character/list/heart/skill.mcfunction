## 하트 스킬 효과
execute if entity @s[tag=heartskill] run effect give @s strength infinite 0 true
execute if entity @s[tag=heartskill] at @s run particle dust{color:[1.000,0.796,0.239],scale:1} ~ ~1 ~ 0.5 0.5 0.5 0 10
execute if entity @s[tag=heartskill] run scoreboard players add @s heartskill 1

## 하트 스킬 효과 제거
execute if entity @s[scores={heartskill=100..}] run effect clear @s strength
execute if entity @s[scores={heartskill=100..}] run tag @s remove heartskill
execute if entity @s[scores={heartskill=100..}] run scoreboard players reset @s heartskill

## 하트 스킬 쿨타임
execute if entity @s[tag=heartcool] run scoreboard players add @s sc 1
execute if entity @s[scores={sc=240}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={sc=260}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={sc=280}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={sc=300}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute if entity @s[scores={sc=300..}] run clear @s barrier
execute if entity @s[scores={sc=300..}] run tag @s remove heartcool
execute if entity @s[scores={sc=300..}] run scoreboard players reset @s sc