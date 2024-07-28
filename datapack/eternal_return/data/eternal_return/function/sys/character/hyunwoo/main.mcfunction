## 우클릭 했을 때
execute as @a[tag=hyunwoo,scores={right=1..}] run tag @s add hyunwooskill
execute as @a[tag=hyunwoo,scores={right=1..}] run tag @s add hyunwoocool
execute as @a[tag=hyunwoo,scores={right=1..}] run item replace entity @s weapon.mainhand with barrier
execute as @a[tag=hyunwoo,scores={right=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute as @a[tag=hyunwoo,scores={right=1..}] at @s run function eternal_return:sys/character/particle/main

## 당근 낚싯대 F 방지
function eternal_return:sys/character/carrot_stick_f

## 현우 스킬 효과 (이동)
function eternal_return:sys/character/hyunwoo/skill_move

## 현우 스킬 효과 (맞은 애 같이 돌진)
execute as @a[tag=hyunwooskill] at @s run tag @e[tag=!hyunwooskill,distance=..1] add hyunwooskill1
execute as @e[tag=hyunwooskill1] at @s run tp @s @e[tag=hyunwooskill,limit=1,sort=nearest]
execute as @a[tag=hyunwooskill] at @s unless block ^ ^ ^1 air run tag @e[tag=hyunwooskill1,distance=..1] add stun

## 현우 스킬 맞은 애 효과 제거
execute as @a[tag=hyunwooskill] at @s unless block ^ ^ ^1 air run tag @s remove hyunwooskill1
execute as @a[scores={hyunwooskill=12..}] at @s run tag @e[distance=..1,tag=hyunwooskill1] remove hyunwooskill1

## 현우 스킬 효과 제거
function eternal_return:sys/character/hyunwoo/kill_marker_bush

execute as @a[tag=hyunwooskill] at @s unless block ^ ^ ^1 air unless block ^ ^ ^1 short_grass run scoreboard players reset @s hyunwooskill
execute as @a[tag=hyunwooskill] at @s unless block ^ ^ ^1 air unless block ^ ^ ^1 short_grass run tag @s remove hyunwooskill

function eternal_return:sys/character/hyunwoo/kill_marker_default

execute as @a[scores={hyunwooskill=12..}] run tag @s remove hyunwooskill
execute as @a[scores={hyunwooskill=12..}] run scoreboard players reset @s hyunwooskill


## 현우 스킬 쿨타임
execute as @a[tag=hyunwoocool] run scoreboard players add @s SC 1
execute as @a[tag=hyunwoo,scores={SC=180}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=hyunwoo,scores={SC=200}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=hyunwoo,scores={SC=220}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=hyunwoo,scores={SC=240}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute as @a[tag=hyunwoo,scores={SC=240..}] run item replace entity @s container.4 with carrot_on_a_stick
execute as @a[tag=hyunwoo,scores={SC=240..}] run tag @s remove hyunwoocool
execute as @a[tag=hyunwoo,scores={SC=240..}] run scoreboard players reset @s SC

## 현우 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=hyunwooskill] unless entity @s[tag=hyunwoo] run tag @s remove hyunwooskill
execute as @a[tag=hyunwoocool] unless entity @s[tag=hyunwoo] run tag @s remove hyunwoocool
execute as @a[scores={hyunwooskill=1..}] unless entity @s[tag=hyunwoo] run scoreboard players reset @s hyunwooskill

## 현우 태그 보유 시 팀 가입
execute as @a[tag=hyunwoo,tag=team1] run team join hyunwoo @s
execute as @a[tag=hyunwoo,tag=team2] run team join hyunwoo @s
execute as @a[tag=hyunwoo,tag=team3] run team join hyunwoo @s
execute as @a[tag=hyunwoo,tag=team4] run team join hyunwoo @s
execute as @a[tag=hyunwoo,tag=team5] run team join hyunwoo @s
execute as @a[tag=hyunwoo,tag=team6] run team join hyunwoo @s
execute as @a[tag=hyunwoo,tag=team7] run team join hyunwoo @s
execute as @a[tag=hyunwoo,tag=team8] run team join hyunwoo @s
execute as @a[tag=hyunwoo,tag=team9] run team join hyunwoo @s
execute as @a[tag=hyunwoo,tag=team10] run team join hyunwoo @s
execute as @a[tag=hyunwoo,tag=team11] run team join hyunwoo @s
execute as @a[tag=hyunwoo,tag=team12] run team join hyunwoo @s
execute as @a[tag=hyunwoo,tag=team13] run team join hyunwoo @s
execute as @a[tag=hyunwoo,tag=team14] run team join hyunwoo @s
execute as @a[tag=hyunwoo,tag=team15] run team join hyunwoo @s
execute as @a[tag=hyunwoo,tag=team16] run team join hyunwoo @s
execute as @a[tag=hyunwoo,tag=team17] run team join hyunwoo @s
execute as @a[tag=hyunwoo,tag=team18] run team join hyunwoo @s