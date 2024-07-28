## 우클릭 했을 때
execute as @a[tag=isol,scores={right=1..}] run tag @s add isolskill
execute as @a[tag=isol,scores={right=1..}] run tag @s add isolcool
execute as @a[tag=isol,scores={right=1..}] run item replace entity @s weapon.mainhand with barrier
execute as @a[tag=isol,scores={right=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute as @a[tag=isol,scores={right=1..}] at @s run function eternal_return:sys/character/particle/main

## 당근 낚싯대 F 방지
function eternal_return:sys/character/carrot_stick_f

## 아이솔 스킬 효과
execute as @a[tag=isolskill] run effect give @s invisibility infinite 0 true
execute as @a[tag=isolskill] at @s run particle dust{color:[1.000,0.796,0.239],scale:1} ~ ~1 ~ 0.5 0.5 0.5 0 10
execute as @a[tag=isolskill] run scoreboard players add @s isolskill 1

## 아이솔 스킬 효과 제거
execute as @a[scores={isolskill=40..}] run effect clear @s invisibility
execute as @a[scores={isolskill=40..}] run tag @s remove isolskill
execute as @a[scores={isolskill=40..}] run scoreboard players reset @s isolskill

## 아이솔 스킬 쿨타임
execute as @a[tag=isolcool] run scoreboard players add @s SC 1
execute as @a[tag=isol,scores={SC=240}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=isol,scores={SC=260}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=isol,scores={SC=280}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=isol,scores={SC=300}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute as @a[tag=isol,scores={SC=300..}] run item replace entity @s container.4 with carrot_on_a_stick
execute as @a[tag=isol,scores={SC=300..}] run tag @s remove isolcool
execute as @a[tag=isol,scores={SC=300..}] run scoreboard players reset @s SC

## 아이솔 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=isolskill] unless entity @s[tag=isol] run tag @s remove isolskill
execute as @a[tag=isolcool] unless entity @s[tag=isol] run tag @s remove isolcool
execute as @a[scores={isolskill=1..}] unless entity @s[tag=isol] run scoreboard players reset @s isolskill

## 아이솔 태그 보유 시 팀 가입
execute as @a[tag=isol,tag=team1] run team join isol @s
execute as @a[tag=isol,tag=team2] run team join isol @s
execute as @a[tag=isol,tag=team3] run team join isol @s
execute as @a[tag=isol,tag=team4] run team join isol @s
execute as @a[tag=isol,tag=team5] run team join isol @s
execute as @a[tag=isol,tag=team6] run team join isol @s
execute as @a[tag=isol,tag=team7] run team join isol @s
execute as @a[tag=isol,tag=team8] run team join isol @s
execute as @a[tag=isol,tag=team9] run team join isol @s
execute as @a[tag=isol,tag=team10] run team join isol @s
execute as @a[tag=isol,tag=team11] run team join isol @s
execute as @a[tag=isol,tag=team12] run team join isol @s
execute as @a[tag=isol,tag=team13] run team join isol @s
execute as @a[tag=isol,tag=team14] run team join isol @s
execute as @a[tag=isol,tag=team15] run team join isol @s
execute as @a[tag=isol,tag=team16] run team join isol @s
execute as @a[tag=isol,tag=team17] run team join isol @s
execute as @a[tag=isol,tag=team18] run team join isol @s