## 시셀라 피 없을 때
execute as @a[tag=sissela,scores={hp=..9}] run tag @s add sisselaskill
execute as @a[tag=sisselaskill] run scoreboard players add @s sisselaskill 1
execute as @a[scores={sisselaskill=1}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2
execute as @a[tag=sissela,scores={hp=10..}] run tag @s remove sisselaskill

## 스킬 사용 이펙트
execute as @a[scores={sisselaskill=1}] at @s run function eternal_return:sys/character/particle/main

## 시셀라 스킬 효과
execute as @a[tag=sisselaskill] run effect give @s regeneration infinite 0 true
execute as @a[tag=sisselaskill] at @s run particle minecraft:happy_villager ~ ~ ~ 0.3 0.3 0.3 0.1 1 force

## 시셀라 스킬 효과 제거
execute as @a[tag=sissela,tag=!sisselaskill] run effect clear @s regeneration

## 시셀라 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=sissela] unless entity @s[tag=sisselaskill] run scoreboard players reset @s sisselaskill
execute as @a[tag=sisselaskill] unless entity @s[tag=sissela] run tag @s remove sisselaskill

## 시셀라 태그 보유 시 팀 가입
execute as @a[tag=sissela,tag=team1] run team join sissela @s
execute as @a[tag=sissela,tag=team2] run team join sissela @s
execute as @a[tag=sissela,tag=team3] run team join sissela @s
execute as @a[tag=sissela,tag=team4] run team join sissela @s
execute as @a[tag=sissela,tag=team5] run team join sissela @s
execute as @a[tag=sissela,tag=team6] run team join sissela @s
execute as @a[tag=sissela,tag=team7] run team join sissela @s
execute as @a[tag=sissela,tag=team8] run team join sissela @s
execute as @a[tag=sissela,tag=team9] run team join sissela @s
execute as @a[tag=sissela,tag=team10] run team join sissela @s
execute as @a[tag=sissela,tag=team11] run team join sissela @s
execute as @a[tag=sissela,tag=team12] run team join sissela @s
execute as @a[tag=sissela,tag=team13] run team join sissela @s
execute as @a[tag=sissela,tag=team14] run team join sissela @s
execute as @a[tag=sissela,tag=team15] run team join sissela @s
execute as @a[tag=sissela,tag=team16] run team join sissela @s
execute as @a[tag=sissela,tag=team17] run team join sissela @s
execute as @a[tag=sissela,tag=team18] run team join sissela @s