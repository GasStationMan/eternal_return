## 라우라 스킬 효과 (예고장 소환)
function eternal_return:sys/character/laura/summon_marker

function eternal_return:sys/character/laura/tp_marker

function eternal_return:sys/character/laura/add_score_marker

function eternal_return:sys/character/laura/particle_marker

execute as @e[scores={lauram=21..}] run kill @s

execute if entity @s[tag=lauraskill] at @s run tag @s remove lauraskill

## 라우라 스킬 효과 (예고장 효과)
function eternal_return:sys/character/laura/skill_hit

execute as @e[tag=lauraskill1] run scoreboard players add @s lauraskill 1
execute as @e[tag=lauraskill1] run effect give @s weakness infinite 0 true
execute as @e[tag=lauraskill1] run effect give @s slowness infinite 0 true
execute as @e[tag=lauraskill1] at @s run particle dust{color:[0.804,0.259,1.000],scale:1} ~ ~1 ~ 0.5 0.5 0.5 0.05 5
execute as @e[tag=lauraskill1] at @s run particle witch ~ ~1 ~ 0.3 0.3 0.3 0.01 3

## 라우라 스킬 맞은 애 효과 제거
execute as @e[scores={lauraskill=60..}] run tag @s remove lauraskill1
execute as @e[scores={lauraskill=60..}] run effect clear @s weakness
execute as @e[scores={lauraskill=60..}] run effect clear @s slowness
execute as @e[scores={lauraskill=60..}] run scoreboard players reset @s lauraskill

## 라우라 스킬 쿨타임
execute if entity @s[tag=lauracool] run scoreboard players add @s SC 1
execute if entity @s[scores={SC=180}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=200}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=220}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=240}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute if entity @s[scores={SC=240..}] run clear @s barrier
execute if entity @s[scores={SC=240..}] run tag @s remove lauracool
execute if entity @s[scores={SC=240..}] run scoreboard players reset @s SC
