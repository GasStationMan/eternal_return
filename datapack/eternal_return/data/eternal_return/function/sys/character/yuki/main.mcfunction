## 우클릭 했을 때
execute as @a[tag=yuki,scores={right=1..}] run tag @s add yukiskill
execute as @a[tag=yuki,scores={right=1..}] run tag @s add yukicool
execute as @a[tag=yuki,scores={right=1..}] run item replace entity @s weapon.mainhand with barrier
execute as @a[tag=yuki,scores={right=1..}] at @s run playsound minecraft:entity.wither.death player @a ~ ~ ~ 1 2
execute as @a[tag=yuki,scores={right=1..}] at @s run tp @s ~ ~ ~ ~ 0

## 스킬 사용 이펙트
execute as @a[tag=yuki,scores={right=1..}] at @s run function eternal_return:sys/character/particle/main

## 당근 낚싯대 F 방지
function eternal_return:sys/character/carrot_stick_f

## 유키 스킬 효과 1
execute as @a[tag=yukiskill] run scoreboard players add @s yukiskill 1

## 유키 화무십일홍 범위 표시
execute as @a[scores={yukiskill=1}] at @s run function eternal_return:sys/character/yuki/yukir1

execute as @e[tag=yukir1] at @s run particle minecraft:dust{color:[1,1,1],scale:1} ~ ~1 ~ 0.5 0.1 0.5 0.05 50

execute if entity @a[scores={yukiskill=1}] as @e[tag=yukir11] at @s run tp @s ~ ~ ~ facing entity @a[tag=yukiskill,limit=1,sort=nearest]
execute as @a[tag=yukiskill] at @s facing entity @e[tag=yukir11] eyes run tp @s @e[tag=yukir11,limit=1,sort=nearest]
execute as @a[scores={yukiskill=20}] at @s run kill @e[tag=yukir11,limit=1,sort=nearest]

## 유키 화무십일홍 공격
execute as @a[scores={yukiskill=20}] at @s run function eternal_return:sys/character/yuki/yukir2
function eternal_return:sys/character/yuki/tag_add_yukir2

execute as @e[tag=yukir2] at @s run particle minecraft:cherry_leaves ~ ~1 ~ 0.5 0.1 0.5 0.05 50 force
function eternal_return:sys/character/yuki/tag_add_yukir3

## 유키 화무십일홍 데미지
execute as @e[tag=yukir3] run scoreboard players add @s yukir 1
execute as @e[scores={yukir=1}] run damage @s 7 magic
execute as @e[scores={yukir=1}] run effect give @s slowness infinite 2 true
execute as @e[scores={yukir=1..29}] at @s run particle dust{color:[1.000,0.510,0.984],scale:1} ~ ~1 ~ 0.3 0.3 0.3 0 5 force
execute as @e[scores={yukir=30}] run damage @s 7 magic
execute as @e[scores={yukir=30}] run effect clear @s slowness
execute as @e[scores={yukir=30}] run tag @s remove yukir3
execute as @e[scores={yukir=30}] run scoreboard players reset @s yukir

## 유키 스킬 효과 제거
execute as @a[scores={yukiskill=20..}] unless entity @e[tag=yukir3] run effect clear @s slowness
execute as @a[scores={yukiskill=20..}] unless entity @e[tag=yukir3] run tag @s remove yukiskill
execute as @a[scores={yukiskill=20..}] unless entity @e[tag=yukir3] run scoreboard players reset @s yukiskill
execute as @a[scores={yukiskill=50..}] run effect clear @s slowness
execute as @a[scores={yukiskill=50..}] run tag @s remove yukiskill
execute as @a[scores={yukiskill=50..}] run scoreboard players reset @s yukiskill

## 유키 스킬 쿨타임
execute as @a[tag=yukicool] run scoreboard players add @s SC 1
execute as @a[tag=yuki,scores={SC=240}] run tellraw @s ["",{"text":"3초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=yuki,scores={SC=260}] run tellraw @s ["",{"text":"2초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=yuki,scores={SC=280}] run tellraw @s ["",{"text":"1초 후 스킬을 다시 사용할 수 있습니다.","color":"yellow"}]
execute as @a[tag=yuki,scores={SC=300}] run tellraw @s ["",{"text":"스킬 사용 가능!","color":"aqua"}]
execute as @a[tag=yuki,scores={SC=300..}] run item replace entity @s container.4 with carrot_on_a_stick
execute as @a[tag=yuki,scores={SC=300..}] run tag @s remove yukicool
execute as @a[tag=yuki,scores={SC=300..}] run scoreboard players reset @s SC

## 유키 태그 제거 했을 때 관련 태그 제거
execute as @a[tag=yukiskill] unless entity @s[tag=yuki] run tag @s remove yukiskill
execute as @a[tag=yukicool] unless entity @s[tag=yuki] run tag @s remove yukicool
execute as @a[scores={yukiskill=1..}] unless entity @s[tag=yuki] run scoreboard players reset @s yukiskill

## 유키 태그 보유 시 팀 가입
execute as @a[tag=yuki,tag=team1] run team join yuki @s
execute as @a[tag=yuki,tag=team2] run team join yuki @s
execute as @a[tag=yuki,tag=team3] run team join yuki @s
execute as @a[tag=yuki,tag=team4] run team join yuki @s
execute as @a[tag=yuki,tag=team5] run team join yuki @s
execute as @a[tag=yuki,tag=team6] run team join yuki @s
execute as @a[tag=yuki,tag=team7] run team join yuki @s
execute as @a[tag=yuki,tag=team8] run team join yuki @s
execute as @a[tag=yuki,tag=team9] run team join yuki @s
execute as @a[tag=yuki,tag=team10] run team join yuki @s
execute as @a[tag=yuki,tag=team11] run team join yuki @s
execute as @a[tag=yuki,tag=team12] run team join yuki @s
execute as @a[tag=yuki,tag=team13] run team join yuki @s
execute as @a[tag=yuki,tag=team14] run team join yuki @s
execute as @a[tag=yuki,tag=team15] run team join yuki @s
execute as @a[tag=yuki,tag=team16] run team join yuki @s
execute as @a[tag=yuki,tag=team17] run team join yuki @s
execute as @a[tag=yuki,tag=team18] run team join yuki @s