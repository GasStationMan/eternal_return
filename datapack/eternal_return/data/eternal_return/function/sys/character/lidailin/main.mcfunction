## 우클릭 했을 때
execute as @a[tag=lidailin,scores={right=1..}] run tag @s add lidailinskill
execute as @a[tag=lidailin,scores={right=1..}] run tag @s add lidailincool
execute as @a[tag=lidailin,scores={right=1..}] run item replace entity @s weapon.mainhand with barrier
execute as @a[tag=lidailin,scores={right=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2

## 스킬 사용 이펙트
execute as @a[tag=lidailin,scores={right=1..}] at @s run function eternal_return:sys/character/particle/main

## 당근 낚싯대 F 방지
function eternal_return:sys/character/carrot_stick_f

## 리다이린 스킬 효과
execute as @a[tag=lidailinskill] run effect give @s strength infinite 1 true
execute as @a[tag=lidailinskill] run effect give @s nausea infinite 3 true
execute as @a[tag=lidailinskill] at @s run particle dust{color:[1.000,0.796,0.239],scale:1} ~ ~1 ~ 0.5 0.5 0.5 0 10
execute as @a[tag=lidailinskill] run scoreboard players add @s lidailinskill 1

## 리다이린 스킬 효과 제거
execute as @a[scores={lidailinskill=100..}] run effect clear @s strength
execute as @a[scores={lidailinskill=100..}] run effect clear @s nausea
execute as @a[scores={lidailinskill=100..}] run tag @s remove lidailinskill
execute as @a[scores={lidailinskill=100..}] run scoreboard players reset @s lidailinskill

## 리다이린 스킬 쿨타임
execute as @a[tag=lidailincool] run scoreboard players add @s SC 1
execute as @a[tag=lidailin,scores={SC=240}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=lidailin,scores={SC=260}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=lidailin,scores={SC=280}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=lidailin,scores={SC=300}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute as @a[tag=lidailin,scores={SC=300..}] run item replace entity @s container.4 with carrot_on_a_stick
execute as @a[tag=lidailin,scores={SC=300..}] run tag @s remove lidailincool
execute as @a[tag=lidailin,scores={SC=300..}] run scoreboard players reset @s SC

## 리다이린 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=lidailinskill] unless entity @s[tag=lidailin] run tag @s remove lidailinskill
execute as @a[tag=lidailincool] unless entity @s[tag=lidailin] run tag @s remove lidailincool
execute as @a[scores={lidailinskill=1..}] unless entity @s[tag=lidailin] run scoreboard players reset @s lidailinskill

## 리다이린 태그 보유 시 팀 가입
execute as @a[tag=lidailin,tag=team1] run team join lidailin @s
execute as @a[tag=lidailin,tag=team2] run team join lidailin @s
execute as @a[tag=lidailin,tag=team3] run team join lidailin @s
execute as @a[tag=lidailin,tag=team4] run team join lidailin @s
execute as @a[tag=lidailin,tag=team5] run team join lidailin @s
execute as @a[tag=lidailin,tag=team6] run team join lidailin @s
execute as @a[tag=lidailin,tag=team7] run team join lidailin @s
execute as @a[tag=lidailin,tag=team8] run team join lidailin @s
execute as @a[tag=lidailin,tag=team9] run team join lidailin @s
execute as @a[tag=lidailin,tag=team10] run team join lidailin @s
execute as @a[tag=lidailin,tag=team11] run team join lidailin @s
execute as @a[tag=lidailin,tag=team12] run team join lidailin @s
execute as @a[tag=lidailin,tag=team13] run team join lidailin @s
execute as @a[tag=lidailin,tag=team14] run team join lidailin @s
execute as @a[tag=lidailin,tag=team15] run team join lidailin @s
execute as @a[tag=lidailin,tag=team16] run team join lidailin @s
execute as @a[tag=lidailin,tag=team17] run team join lidailin @s
execute as @a[tag=lidailin,tag=team18] run team join lidailin @s