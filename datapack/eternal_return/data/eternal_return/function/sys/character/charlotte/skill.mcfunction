## 샬럿 스킬 효과
execute if entity @s[tag=charlotteskill] run effect give @s resistance infinite 100 true
execute if entity @s[tag=charlotteskill] at @s run particle dust{color:[0.431,1.000,0.961],scale:1.5} ~ ~1 ~ 0.5 0.5 0.5 0.03 3 force
execute if entity @s[tag=charlotteskill] run scoreboard players add @s charlotteskill 1

## 샬럿 스킬 효과 제거
execute if entity @s[scores={charlotteskill=40..}] run effect clear @s resistance
execute if entity @s[scores={charlotteskill=40..}] run tag @s remove charlotteskill
execute if entity @s[scores={charlotteskill=40..}] run scoreboard players reset @s charlotteskill

## 샬럿 스킬 쿨타임
execute if entity @s[tag=charlottecool] run scoreboard players add @s SC 1
execute if entity @s[scores={SC=540}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=560}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=580}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=600}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute if entity @s[scores={SC=600..}] run clear @s barrier
execute if entity @s[scores={SC=600..}] run tag @s remove charlottecool
execute if entity @s[scores={SC=600..}] run scoreboard players reset @s SC