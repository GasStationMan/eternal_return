## 유키 스킬 효과 1
execute if entity @s[tag=yukiskill] run scoreboard players add @s yukiskill 1

## 유키 화무십일홍 범위 표시
execute if entity @s[scores={yukiskill=1}] at @s run function eternal_return:sys/character/yuki/yukir1

execute as @e[tag=yukir1] at @s run particle minecraft:dust{color:[1,1,1],scale:1} ~ ~1 ~ 0.5 0.1 0.5 0.05 50

execute if entity @a[scores={yukiskill=1}] as @e[tag=yukir11] at @s run tp @s ~ ~ ~ facing entity @a[tag=yukiskill,limit=1,sort=nearest]
execute if entity @s[tag=yukiskill] at @s facing entity @e[tag=yukir11] eyes run tp @s @e[tag=yukir11,limit=1,sort=nearest]
execute if entity @s[scores={yukiskill=20}] at @s run kill @e[tag=yukir11,limit=1,sort=nearest]

## 유키 화무십일홍 공격
execute if entity @s[scores={yukiskill=20}] at @s run function eternal_return:sys/character/yuki/yukir2
function eternal_return:sys/character/yuki/tag_add_yukir2

execute as @e[tag=yukir2] at @s run particle minecraft:cherry_leaves ~ ~1 ~ 0.5 0.1 0.5 0.05 50 force
function eternal_return:sys/character/yuki/tag_add_yukir3

## 유키 화무십일홍 데미지
execute as @e[tag=yukir3] run scoreboard players add @s yukir 1
execute as @e[scores={yukir=1}] run damage @s 7 magic
execute as @e[scores={yukir=1}] run effect give @s slowness infinite 2 true
execute as @e[scores={yukir=1..29}] at @s run particle dust{color:[1.000,0.510,0.984],scale:1} ~ ~1 ~ 0.3 0.3 0.3 0 5 force
execute as @e[scores={yukir=30}] run damage @s 7 magic
execute as @e[scores={yukir=30}] run effect clear @s slowness
execute as @e[scores={yukir=30}] run tag @s remove yukir3
execute as @e[scores={yukir=30}] run scoreboard players reset @s yukir

## 유키 스킬 효과 제거
execute if entity @s[scores={yukiskill=20..}] unless entity @e[tag=yukir3] run effect clear @s slowness
execute if entity @s[scores={yukiskill=20..}] unless entity @e[tag=yukir3] run tag @s remove yukiskill
execute if entity @s[scores={yukiskill=20..}] unless entity @e[tag=yukir3] run scoreboard players reset @s yukiskill
execute if entity @s[scores={yukiskill=50..}] run effect clear @s slowness
execute if entity @s[scores={yukiskill=50..}] run tag @s remove yukiskill
execute if entity @s[scores={yukiskill=50..}] run scoreboard players reset @s yukiskill

## 유키 스킬 쿨타임
execute if entity @s[tag=yukicool] run scoreboard players add @s SC 1
execute if entity @s[scores={SC=240}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=260}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=280}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={SC=300}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute if entity @s[scores={SC=300..}] run clear @s barrier
execute if entity @s[scores={SC=300..}] run tag @s remove yukicool
execute if entity @s[scores={SC=300..}] run scoreboard players reset @s SC