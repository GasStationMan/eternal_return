## 아르다가 채집 했을 때
execute as @a[tag=arda,tag=get_tree,tag=charge2,tag=done_loading] run tag @s add ardaskill
execute as @a[tag=arda,tag=get_meteor,tag=charge2,tag=done_loading] run tag @s add ardaskill

## 스킬 사용 사운드
execute as @a[tag=ardaskill] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute as @a[tag=ardaskill] at @s run function eternal_return:sys/character/particle/main

## 아르다 스킬 효과
execute as @a[tag=arda,tag=ardaskill] run scoreboard players add @s credit 50

## 아르다 스킬 효과 제거
tag @a[tag=ardaskill] remove ardaskill

## 아르다 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=ardaskill] unless entity @s[tag=arda] run tag @s remove ardaskill

## 아르다 태그 보유 시 팀 가입
execute as @a[tag=arda,tag=team1] run team join arda @s
execute as @a[tag=arda,tag=team2] run team join arda @s
execute as @a[tag=arda,tag=team3] run team join arda @s
execute as @a[tag=arda,tag=team4] run team join arda @s
execute as @a[tag=arda,tag=team5] run team join arda @s
execute as @a[tag=arda,tag=team6] run team join arda @s
execute as @a[tag=arda,tag=team7] run team join arda @s
execute as @a[tag=arda,tag=team8] run team join arda @s
execute as @a[tag=arda,tag=team9] run team join arda @s
execute as @a[tag=arda,tag=team10] run team join arda @s
execute as @a[tag=arda,tag=team11] run team join arda @s
execute as @a[tag=arda,tag=team12] run team join arda @s
execute as @a[tag=arda,tag=team13] run team join arda @s
execute as @a[tag=arda,tag=team14] run team join arda @s
execute as @a[tag=arda,tag=team15] run team join arda @s
execute as @a[tag=arda,tag=team16] run team join arda @s
execute as @a[tag=arda,tag=team17] run team join arda @s
execute as @a[tag=arda,tag=team18] run team join arda @s
