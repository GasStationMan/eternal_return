## 아야가 맞았을 때
execute if entity @s[scores={dmgtaken=0..},tag=!ayacool] run tag @s add ayaskill
execute if entity @s[scores={dmgtaken=0..},tag=!ayacool] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2
execute if entity @s[scores={dmgtaken=0..}] run tag @s add ayacool

## 스킬 사용 이펙트
execute if entity @s[scores={dmgtaken=0..},tag=!ayacool] at @s run function eternal_return:sys/character/particle/main

## 아야 스킬 효과
execute if entity @s[tag=ayaskill] run scoreboard players add @s ayaskill 1
execute if entity @s[scores={ayaskill=1}] run effect give @s absorption infinite 0 true
execute if entity @s[scores={ayaskill=1}] run damage @s 2 out_of_world
execute if entity @s[tag=ayaskill] at @s run particle dust{color:[1.000,0.910,0.098],scale:1.5} ~ ~1 ~ 0.5 0.5 0.5 0.03 3 force

## 아야 스킬 효과 제거
execute if entity @s[scores={ayaskill=30..}] run effect clear @s absorption
execute if entity @s[scores={ayaskill=30..}] run tag @s remove ayaskill
execute if entity @s[scores={ayaskill=30..}] run scoreboard players reset @s ayaskill

## 아야 스킬 쿨타임
execute if entity @s[tag=ayacool] run scoreboard players add @s sc 1
execute if entity @s[scores={sc=240}] run tellraw @s ["",{"text":"3초 후 패시브 스킬이 활성화 됩니다.","color":"yellow"}]
execute if entity @s[scores={sc=260}] run tellraw @s ["",{"text":"2초 후 패시브 스킬이 활성화 됩니다.","color":"yellow"}]
execute if entity @s[scores={sc=280}] run tellraw @s ["",{"text":"1초 후 패시브 스킬이 활성화 됩니다.","color":"yellow"}]
execute if entity @s[scores={sc=300}] run tellraw @s ["",{"text":"패시브 활성화!","color":"aqua"}]
execute if entity @s[scores={sc=300..}] run tag @s remove ayacool
execute if entity @s[scores={sc=300..}] run scoreboard players reset @s sc

## 아야 태그 보유 시 팀 가입
execute if entity @s[team=!aya] run team join aya @s