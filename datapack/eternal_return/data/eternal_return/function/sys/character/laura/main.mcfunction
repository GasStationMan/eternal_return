## 우클릭 했을 때
execute as @a[tag=laura,scores={right=1..}] run tag @s add lauraskill
execute as @a[tag=laura,scores={right=1..}] run tag @s add lauracool
execute as @a[tag=laura,scores={right=1..}] run item replace entity @s weapon.mainhand with barrier
execute as @a[tag=laura,scores={right=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute as @a[tag=laura,scores={right=1..}] at @s run function eternal_return:sys/character/particle/main

## 당근 낚싯대 F 방지
function eternal_return:sys/character/carrot_stick_f

## 라우라 스킬 효과 (예고장 소환)
function eternal_return:sys/character/laura/summon_marker

function eternal_return:sys/character/laura/tp_marker

function eternal_return:sys/character/laura/add_score_marker

function eternal_return:sys/character/laura/particle_marker

execute as @e[scores={lauram=21..}] run kill @s

execute as @a[tag=lauraskill] at @s run tag @s remove lauraskill

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
execute as @a[tag=lauracool] run scoreboard players add @s SC 1
execute as @a[tag=laura,scores={SC=180}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=laura,scores={SC=200}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=laura,scores={SC=220}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=laura,scores={SC=240}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute as @a[tag=laura,scores={SC=240..}] run item replace entity @s container.4 with carrot_on_a_stick
execute as @a[tag=laura,scores={SC=240..}] run tag @s remove lauracool
execute as @a[tag=laura,scores={SC=240..}] run scoreboard players reset @s SC

## 라우라 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=lauraskill] unless entity @s[tag=laura] run tag @s remove lauraskill
execute as @a[tag=lauracool] unless entity @s[tag=laura] run tag @s remove lauracool
execute as @a[scores={lauram=1..}] unless entity @s[tag=laura] run scoreboard players reset @s lauram
execute as @a[scores={lauraskill=1..}] unless entity @s[tag=laura] run scoreboard players reset @s lauraskill

## 라우라 태그 보유 시 팀 가입
execute as @a[tag=laura,tag=team1] run team join laura @s
execute as @a[tag=laura,tag=team2] run team join laura @s
execute as @a[tag=laura,tag=team3] run team join laura @s
execute as @a[tag=laura,tag=team4] run team join laura @s
execute as @a[tag=laura,tag=team5] run team join laura @s
execute as @a[tag=laura,tag=team6] run team join laura @s
execute as @a[tag=laura,tag=team7] run team join laura @s
execute as @a[tag=laura,tag=team8] run team join laura @s
execute as @a[tag=laura,tag=team9] run team join laura @s
execute as @a[tag=laura,tag=team10] run team join laura @s
execute as @a[tag=laura,tag=team11] run team join laura @s
execute as @a[tag=laura,tag=team12] run team join laura @s
execute as @a[tag=laura,tag=team13] run team join laura @s
execute as @a[tag=laura,tag=team14] run team join laura @s
execute as @a[tag=laura,tag=team15] run team join laura @s
execute as @a[tag=laura,tag=team16] run team join laura @s
execute as @a[tag=laura,tag=team17] run team join laura @s
execute as @a[tag=laura,tag=team18] run team join laura @s