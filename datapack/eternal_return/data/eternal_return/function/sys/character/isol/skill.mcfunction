## 아이솔 스킬 효과
execute if entity @s[tag=isolskill] run effect give @s invisibility infinite 0 true
execute if entity @s[tag=isolskill] run scoreboard players add @s isolskill 1

## 아이솔 스킬 효과 제거
execute if entity @s[scores={isolskill=40..}] run effect clear @s invisibility
execute if entity @s[scores={isolskill=40..}] run tag @s remove isolskill
execute if entity @s[scores={isolskill=40..}] run scoreboard players reset @s isolskill

## 아이솔 스킬 쿨타임
execute if entity @s[tag=isolcool] run scoreboard players add @s SC 1
execute if entity @s[scores={SC=240}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=260}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=280}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=300}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute if entity @s[scores={SC=300..}] run clear @s barrier
execute if entity @s[scores={SC=300..}] run tag @s remove isolcool
execute if entity @s[scores={SC=300..}] run scoreboard players reset @s SC
