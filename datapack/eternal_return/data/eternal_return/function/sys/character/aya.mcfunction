## 아야가 맞았을 때
execute as @a[tag=aya,scores={dmgtaken=0..},tag=!ayacool] run tag @s add ayaskill
execute as @a[tag=aya,scores={dmgtaken=0..},tag=!ayacool] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2
execute as @a[tag=aya,scores={dmgtaken=0..}] run tag @s add ayacool

## 스킬 사용 이펙트
execute as @a[tag=aya,scores={dmgtaken=0..},tag=!ayacool] at @s run function eternal_return:sys/character/particle/main

## 아야 스킬 효과
execute as @a[tag=ayaskill] run scoreboard players add @s ayaskill 1
execute as @a[scores={ayaskill=1}] run effect give @s absorption infinite 0 true
execute as @a[scores={ayaskill=1}] run damage @s 2 out_of_world
execute as @a[tag=ayaskill] at @s run particle dust{color:[1.000,0.910,0.098],scale:1.5} ~ ~1 ~ 0.5 0.5 0.5 0.03 3 force

## 아야 스킬 효과 제거
execute as @a[scores={ayaskill=30..}] run effect clear @s absorption
execute as @a[scores={ayaskill=30..}] run tag @s remove ayaskill
execute as @a[scores={ayaskill=30..}] run scoreboard players reset @s ayaskill

## 아야 스킬 쿨타임
execute as @a[tag=ayacool] run scoreboard players add @s SC 1
execute as @a[tag=aya,scores={SC=240}] run tellraw @s ["",{"text":"3초 후 패시브 스킬이 활성화 됩니다.","color":"yellow"}]
execute as @a[tag=aya,scores={SC=260}] run tellraw @s ["",{"text":"2초 후 패시브 스킬이 활성화 됩니다.","color":"yellow"}]
execute as @a[tag=aya,scores={SC=280}] run tellraw @s ["",{"text":"1초 후 패시브 스킬이 활성화 됩니다.","color":"yellow"}]
execute as @a[tag=aya,scores={SC=300}] run tellraw @s ["",{"text":"패시브 활성화!","color":"aqua"}]
execute as @a[tag=aya,scores={SC=300..}] run tag @s remove ayacool
execute as @a[tag=aya,scores={SC=300..}] run scoreboard players reset @s SC

## 아야 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=ayaskill] unless entity @s[tag=aya] run tag @s remove ayaskill
execute as @a[tag=ayacool] unless entity @s[tag=aya] run tag @s remove ayacool
execute as @a[scores={ayaskill=1..}] unless entity @s[tag=aya] run scoreboard players reset @s ayaskill

## 아야 태그 보유 시 팀 가입
execute as @a[tag=aya,tag=team1] run team join aya @s
execute as @a[tag=aya,tag=team2] run team join aya @s
execute as @a[tag=aya,tag=team3] run team join aya @s
execute as @a[tag=aya,tag=team4] run team join aya @s
execute as @a[tag=aya,tag=team5] run team join aya @s
execute as @a[tag=aya,tag=team6] run team join aya @s
execute as @a[tag=aya,tag=team7] run team join aya @s
execute as @a[tag=aya,tag=team8] run team join aya @s
execute as @a[tag=aya,tag=team9] run team join aya @s
execute as @a[tag=aya,tag=team10] run team join aya @s
execute as @a[tag=aya,tag=team11] run team join aya @s
execute as @a[tag=aya,tag=team12] run team join aya @s
execute as @a[tag=aya,tag=team13] run team join aya @s
execute as @a[tag=aya,tag=team14] run team join aya @s
execute as @a[tag=aya,tag=team15] run team join aya @s
execute as @a[tag=aya,tag=team16] run team join aya @s
execute as @a[tag=aya,tag=team17] run team join aya @s
execute as @a[tag=aya,tag=team18] run team join aya @s