## 에키온 스킬 효과
execute if entity @s[tag=echionskill] run effect give @s strength infinite 0 true
execute if entity @s[tag=echionskill] run effect give @s speed infinite 0 true
execute if entity @s[tag=echionskill] at @s run particle witch ~ ~1 ~ 0.5 0.5 0.5 0 5
execute if entity @s[tag=echionskill] run scoreboard players add @s echionskill 1

## 에키온 스킬 효과 제거
execute if entity @s[scores={echionskill=140..}] run effect clear @s strength
execute if entity @s[scores={echionskill=140..}] run effect clear @s speed
execute if entity @s[scores={echionskill=140..}] run tag @s remove echionskill
execute if entity @s[scores={echionskill=140..}] run scoreboard players reset @s echionskill

## 에키온 현타
execute if entity @s[scores={sc=140}] run tag @s add echionrest
execute if entity @s[tag=echionrest] run effect give @s slowness 1 1 true
execute if entity @s[tag=echionrest] run effect give @s weakness 1 1 true
execute if entity @s[tag=echionrest] at @s run particle minecraft:ominous_spawning ~ ~1 ~ 0.5 0.5 0.5 0.05 5

## 에키온 현타 제거
execute if entity @s[scores={sc=200}] run tag @s remove echionrest
execute if entity @s[scores={sc=200}] run effect clear @s slowness
execute if entity @s[scores={sc=200}] run effect clear @s weakness

## 에키온 스킬 쿨타임
execute if entity @s[tag=echioncool] run scoreboard players add @s sc 1
execute if entity @s[scores={sc=240}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={sc=260}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={sc=280}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={sc=300}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute if entity @s[scores={sc=300..}] run clear @s barrier
execute if entity @s[scores={sc=300..}] run tag @s remove echioncool
execute if entity @s[scores={sc=300..}] run scoreboard players reset @s sc