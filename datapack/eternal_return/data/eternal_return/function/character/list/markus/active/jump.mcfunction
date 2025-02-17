scoreboard players add @s markus_jump 1

# 도약 모션
execute if score @s markus_jump matches 1.. run tp @s ~ ~ ~ ~ 30
execute if score @s markus_jump matches 1 run tp @s ~ ~1.5 ~
execute if score @s markus_jump matches 2 run tp @s ~ ~1.5 ~
execute if score @s markus_jump matches 3 at @s if block ^ ^ ^1 air run tp @s ^ ^ ^0.5
execute if score @s markus_jump matches 3 at @s if block ^ ^ ^1 air run tp @s ^ ^ ^0.5
execute if score @s markus_jump matches 3 at @s if block ^ ^ ^1 air run tp @s ^ ^ ^0.5
execute if score @s markus_jump matches 4 at @s if block ^ ^ ^1 air run tp @s ^ ^ ^0.5
execute if score @s markus_jump matches 4 at @s if block ^ ^ ^1 air run tp @s ^ ^ ^0.5
execute if score @s markus_jump matches 4 at @s if block ^ ^ ^1 air run tp @s ^ ^ ^0.5
execute if score @s markus_jump matches 5 at @s if block ^ ^ ^1 air run tp @s ^ ^ ^0.5
execute if score @s markus_jump matches 5 at @s if block ^ ^ ^1 air run tp @s ^ ^ ^0.5
execute if score @s markus_jump matches 5 at @s if block ^ ^ ^1 air run tp @s ^ ^ ^0.5

# 실질적 이동 마커 생성 and 이동
execute if score @s markus_jump matches 1 run summon marker ~ ~ ~ {Tags:["markus_jump_marker"]}
execute if score @s markus_jump matches 1 run tp @e[tag=markus_jump_marker,distance=..0.1] ~ ~ ~ ~ 0
execute if score @s markus_jump matches 3 at @e[tag=markus_jump_marker] if block ^ ^ ^1 air run tp @e[tag=markus_jump_marker] ^ ^ ^0.3
execute if score @s markus_jump matches 3 at @e[tag=markus_jump_marker] if block ^ ^ ^1 air run tp @e[tag=markus_jump_marker] ^ ^ ^0.3
execute if score @s markus_jump matches 3 at @e[tag=markus_jump_marker] if block ^ ^ ^1 air run tp @e[tag=markus_jump_marker] ^ ^ ^0.3
execute if score @s markus_jump matches 4 at @e[tag=markus_jump_marker] if block ^ ^ ^1 air run tp @e[tag=markus_jump_marker] ^ ^ ^0.3
execute if score @s markus_jump matches 4 at @e[tag=markus_jump_marker] if block ^ ^ ^1 air run tp @e[tag=markus_jump_marker] ^ ^ ^0.3
execute if score @s markus_jump matches 4 at @e[tag=markus_jump_marker] if block ^ ^ ^1 air run tp @e[tag=markus_jump_marker] ^ ^ ^0.3
execute if score @s markus_jump matches 5 at @e[tag=markus_jump_marker] if block ^ ^ ^1 air run tp @e[tag=markus_jump_marker] ^ ^ ^0.3
execute if score @s markus_jump matches 5 at @e[tag=markus_jump_marker] if block ^ ^ ^1 air run tp @e[tag=markus_jump_marker] ^ ^ ^0.3
execute if score @s markus_jump matches 5 at @e[tag=markus_jump_marker] if block ^ ^ ^1 air run tp @e[tag=markus_jump_marker] ^ ^ ^0.3

# 마커로 최종 이동
execute if score @s markus_jump matches 5.. run tp @s @e[tag=markus_jump_marker,limit=1]
execute if score @s markus_jump matches 5.. at @s run tp @s ~ ~ ~ ~ 30

# 마커, 태그 부여, 제거
execute if entity @s[scores={markus_jump=5..}] run kill @n[tag=markus_jump_marker]
execute unless block ~ ~-1 ~ air if entity @s[scores={markus_jump=5..}] run tag @s add markus_skill
execute unless block ~ ~-1 ~ air if entity @s[scores={markus_jump=5..}] run tag @s remove markus_jump

# 태그 제거 시 스코어보드 초기화
execute unless entity @s[tag=markus_jump] run scoreboard players reset @s markus_jump