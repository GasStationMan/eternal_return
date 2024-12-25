## 현우 스킬 효과 (이동)
function eternal_return:sys/character/hyunwoo/skill_move

## 현우 스킬 효과 (맞은 애 같이 돌진)
execute if entity @s[tag=hyunwooskill] at @s run tag @e[tag=!hyunwooskill,distance=..1] add hyunwooskill1
execute as @e[tag=hyunwooskill1] at @s run tp @s @e[tag=hyunwooskill,limit=1,sort=nearest]
execute if entity @s[tag=hyunwooskill] at @s unless block ^ ^ ^1 air run tag @e[tag=hyunwooskill1,distance=..1] add stun

## 현우 스킬 맞은 애 효과 제거
execute if entity @s[tag=hyunwooskill] at @s unless block ^ ^ ^1 air run tag @s remove hyunwooskill1
execute if entity @s[scores={hyunwooskill=12..}] at @s run tag @e[distance=..1,tag=hyunwooskill1] remove hyunwooskill1

## 현우 스킬 효과 제거
function eternal_return:sys/character/hyunwoo/kill_marker_bush

execute if entity @s[tag=hyunwooskill] at @s unless block ^ ^ ^1 air unless block ^ ^ ^1 short_grass run scoreboard players reset @s hyunwooskill
execute if entity @s[tag=hyunwooskill] at @s unless block ^ ^ ^1 air unless block ^ ^ ^1 short_grass run tag @s remove hyunwooskill

function eternal_return:sys/character/hyunwoo/kill_marker_default

execute if entity @s[scores={hyunwooskill=12..}] run tag @s remove hyunwooskill
execute if entity @s[scores={hyunwooskill=12..}] run scoreboard players reset @s hyunwooskill


## 현우 스킬 쿨타임
execute if entity @s[tag=hyunwoocool] run scoreboard players add @s sc 1
execute if entity @s[scores={sc=180}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={sc=200}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={sc=220}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute if entity @s[scores={sc=240}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute if entity @s[scores={sc=240..}] run clear @s barrier
execute if entity @s[scores={sc=240..}] run tag @s remove hyunwoocool
execute if entity @s[scores={sc=240..}] run scoreboard players reset @s sc