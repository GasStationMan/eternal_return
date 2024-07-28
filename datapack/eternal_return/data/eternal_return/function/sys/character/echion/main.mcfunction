## 우클릭 했을 때
execute as @a[tag=echion,scores={right=1..}] run tag @s add echionskill
execute as @a[tag=echion,scores={right=1..}] run tag @s add echioncool
execute as @a[tag=echion,scores={right=1..}] run item replace entity @s weapon.mainhand with barrier
execute as @a[tag=echion,scores={right=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute as @a[tag=echion,scores={right=1..}] at @s run function eternal_return:sys/character/particle/main

## 당근 낚싯대 F 방지
function eternal_return:sys/character/carrot_stick_f

## 에키온 스킬 효과
execute as @a[tag=echionskill] run effect give @s strength infinite 0 true
execute as @a[tag=echionskill] run effect give @s speed infinite 0 true
execute as @a[tag=echionskill] at @s run particle witch ~ ~1 ~ 0.5 0.5 0.5 0 5
execute as @a[tag=echionskill] run scoreboard players add @s echionskill 1

## 에키온 스킬 효과 제거
execute as @a[scores={echionskill=140..}] run effect clear @s strength
execute as @a[scores={echionskill=140..}] run effect clear @s speed
execute as @a[scores={echionskill=140..}] run tag @s remove echionskill
execute as @a[scores={echionskill=140..}] run scoreboard players reset @s echionskill

## 에키온 현타
execute as @a[tag=echion,scores={SC=140}] run tag @s add echionrest
execute as @a[tag=echionrest] run effect give @s slowness 1 1 true
execute as @a[tag=echionrest] run effect give @s weakness 1 1 true
execute as @a[tag=echionrest] at @s run particle minecraft:ominous_spawning ~ ~1 ~ 0.5 0.5 0.5 0.05 5

## 에키온 현타 제거
execute as @a[tag=echion,scores={SC=200}] run tag @s remove echionrest
execute as @a[tag=echion,scores={SC=200}] run effect clear @s slowness
execute as @a[tag=echion,scores={SC=200}] run effect clear @s weakness

## 에키온 스킬 쿨타임
execute as @a[tag=echioncool] run scoreboard players add @s SC 1
execute as @a[tag=echion,scores={SC=240}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=echion,scores={SC=260}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=echion,scores={SC=280}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=echion,scores={SC=300}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute as @a[tag=echion,scores={SC=300..}] run item replace entity @s container.4 with carrot_on_a_stick
execute as @a[tag=echion,scores={SC=300..}] run tag @s remove echioncool
execute as @a[tag=echion,scores={SC=300..}] run scoreboard players reset @s SC

## 에키온 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=echionskill] unless entity @s[tag=echion] run tag @s remove echionskill
execute as @a[tag=echioncool] unless entity @s[tag=echion] run tag @s remove echioncool
execute as @a[scores={echionskill=1..}] unless entity @s[tag=echion] run scoreboard players reset @s echionskill

## 에키온 태그 보유 시 팀 가입
execute as @a[tag=echion,tag=team1] run team join echion @s
execute as @a[tag=echion,tag=team2] run team join echion @s
execute as @a[tag=echion,tag=team3] run team join echion @s
execute as @a[tag=echion,tag=team4] run team join echion @s
execute as @a[tag=echion,tag=team5] run team join echion @s
execute as @a[tag=echion,tag=team6] run team join echion @s
execute as @a[tag=echion,tag=team7] run team join echion @s
execute as @a[tag=echion,tag=team8] run team join echion @s
execute as @a[tag=echion,tag=team9] run team join echion @s
execute as @a[tag=echion,tag=team10] run team join echion @s
execute as @a[tag=echion,tag=team11] run team join echion @s
execute as @a[tag=echion,tag=team12] run team join echion @s
execute as @a[tag=echion,tag=team13] run team join echion @s
execute as @a[tag=echion,tag=team14] run team join echion @s
execute as @a[tag=echion,tag=team15] run team join echion @s
execute as @a[tag=echion,tag=team16] run team join echion @s
execute as @a[tag=echion,tag=team17] run team join echion @s
execute as @a[tag=echion,tag=team18] run team join echion @s