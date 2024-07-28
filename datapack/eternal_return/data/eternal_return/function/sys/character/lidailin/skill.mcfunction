## 리다이린 스킬 효과
execute if entity @s[tag=lidailinskill] run effect give @s strength infinite 1 true
execute if entity @s[tag=lidailinskill] run effect give @s nausea infinite 3 true
execute if entity @s[tag=lidailinskill] at @s run particle dust{color:[1.000,0.796,0.239],scale:1} ~ ~1 ~ 0.5 0.5 0.5 0 10
execute if entity @s[tag=lidailinskill] run scoreboard players add @s lidailinskill 1

## 리다이린 스킬 효과 제거
execute if entity @s[scores={lidailinskill=100..}] run effect clear @s strength
execute if entity @s[scores={lidailinskill=100..}] run effect clear @s nausea
execute if entity @s[scores={lidailinskill=100..}] run tag @s remove lidailinskill
execute if entity @s[scores={lidailinskill=100..}] run scoreboard players reset @s lidailinskill

## 리다이린 스킬 쿨타임
execute if entity @s[tag=lidailincool] run scoreboard players add @s SC 1
execute if entity @s[scores={SC=240}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=260}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=280}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=300}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute if entity @s[scores={SC=300..}] run clear @s barrier
execute if entity @s[scores={SC=300..}] run tag @s remove lidailincool
execute if entity @s[scores={SC=300..}] run scoreboard players reset @s SC