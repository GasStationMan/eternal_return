execute store result score @s[tag=team1] celine_Q_count if entity @e[tag=celine_Q_t1]
execute store result score @s[tag=team2] celine_Q_count if entity @e[tag=celine_Q_t2]
execute store result score @s[tag=team3] celine_Q_count if entity @e[tag=celine_Q_t3]
execute store result score @s[tag=team4] celine_Q_count if entity @e[tag=celine_Q_t4]
execute store result score @s[tag=team5] celine_Q_count if entity @e[tag=celine_Q_t5]
execute store result score @s[tag=team6] celine_Q_count if entity @e[tag=celine_Q_t6]
execute store result score @s[tag=team7] celine_Q_count if entity @e[tag=celine_Q_t7]
execute store result score @s[tag=team8] celine_Q_count if entity @e[tag=celine_Q_t8]
execute store result score @s[tag=team9] celine_Q_count if entity @e[tag=celine_Q_t9]
execute store result score @s[tag=team10] celine_Q_count if entity @e[tag=celine_Q_t10]
execute store result score @s[tag=team11] celine_Q_count if entity @e[tag=celine_Q_t11]
execute store result score @s[tag=team12] celine_Q_count if entity @e[tag=celine_Q_t12]
execute store result score @s[tag=team13] celine_Q_count if entity @e[tag=celine_Q_t13]
execute store result score @s[tag=team14] celine_Q_count if entity @e[tag=celine_Q_t14]
execute store result score @s[tag=team15] celine_Q_count if entity @e[tag=celine_Q_t15]
execute store result score @s[tag=team16] celine_Q_count if entity @e[tag=celine_Q_t16]

execute if entity @s[tag=team1] run tag @s add celine_t1
execute if entity @s[tag=team2] run tag @s add celine_t2
execute if entity @s[tag=team3] run tag @s add celine_t3
execute if entity @s[tag=team4] run tag @s add celine_t4
execute if entity @s[tag=team5] run tag @s add celine_t5
execute if entity @s[tag=team6] run tag @s add celine_t6
execute if entity @s[tag=team7] run tag @s add celine_t7
execute if entity @s[tag=team8] run tag @s add celine_t8
execute if entity @s[tag=team9] run tag @s add celine_t9
execute if entity @s[tag=team10] run tag @s add celine_t10
execute if entity @s[tag=team11] run tag @s add celine_t11
execute if entity @s[tag=team12] run tag @s add celine_t12
execute if entity @s[tag=team13] run tag @s add celine_t13
execute if entity @s[tag=team14] run tag @s add celine_t14
execute if entity @s[tag=team15] run tag @s add celine_t15
execute if entity @s[tag=team16] run tag @s add celine_t16


# Q 폭탄 마커 파티클
execute as @e[tag=celine_Q,scores={celine_Q=1}] at @s run summon block_display ~ ~ ~ {Tags:["celine_Q_display"],Passengers:[{id:"minecraft:block_display",block_state:{Name:"minecraft:diamond_block",Properties:{}},transformation:[0.2625f,0.0000f,0.0000f,-0.1312f,0.0000f,0.2250f,0.0000f,0.0004f,0.0000f,0.0000f,0.2625f,-0.1312f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:iron_block",Properties:{}},transformation:[0.0750f,0.0000f,0.0000f,-0.0375f,0.0000f,0.1969f,0.0000f,0.0469f,0.0000f,0.0000f,0.0703f,-0.1875f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[-0.0000f,0.0000f,0.3281f,-0.1641f,0.0000f,0.2344f,0.0000f,0.0037f,-0.0319f,0.0000f,-0.0000f,-0.1322f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.0319f,0.0000f,0.0000f,-0.1641f,0.0000f,0.2344f,0.0000f,0.0037f,0.0000f,0.0000f,0.3281f,-0.1641f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.0319f,0.0000f,0.0000f,0.1406f,0.0000f,0.2344f,0.0000f,0.0037f,0.0000f,0.0000f,0.3281f,-0.1641f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[-0.0000f,0.0000f,0.3281f,-0.1641f,0.0000f,0.2344f,0.0000f,0.0037f,-0.0319f,0.0000f,-0.0000f,0.1641f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:iron_block",Properties:{}},transformation:[0.0750f,0.0000f,0.0000f,-0.1875f,0.0000f,0.1969f,0.0000f,0.0469f,0.0000f,0.0000f,0.0703f,-0.0375f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:iron_block",Properties:{}},transformation:[0.0750f,0.0000f,0.0000f,0.1125f,0.0000f,0.1969f,0.0000f,0.0469f,0.0000f,0.0000f,0.0703f,-0.0375f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:iron_block",Properties:{}},transformation:[0.0750f,0.0000f,0.0000f,-0.0375f,0.0000f,0.1969f,0.0000f,0.0469f,0.0000f,0.0000f,0.0703f,0.1172f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:iron_block",Properties:{}},transformation:[0.3750f,0.0000f,0.0000f,-0.1875f,0.0000f,0.0469f,0.0000f,-0.0000f,0.0000f,0.0000f,0.3750f,-0.1875f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.0319f,0.0000f,0.0000f,-0.0150f,0.0000f,0.2344f,0.0000f,0.0037f,0.0000f,0.0000f,0.1172f,-0.1641f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.0000f,0.0000f,0.1172f,-0.1641f,0.0000f,0.2344f,0.0000f,0.0037f,-0.0319f,0.0000f,0.0000f,0.0131f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.0319f,0.0000f,0.0000f,-0.0150f,0.0000f,0.2344f,0.0000f,0.0037f,0.0000f,0.0000f,0.1172f,0.0469f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.0000f,0.0000f,0.1172f,0.0469f,0.0000f,0.2344f,0.0000f,0.0037f,-0.0319f,0.0000f,0.0000f,0.0131f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.0938f,0.0000f,0.0000f,-0.0469f,0.0000f,0.0506f,0.0000f,0.1875f,0.0000f,0.0000f,0.0234f,-0.0703f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.0000f,0.0000f,-0.0234f,-0.0469f,0.0000f,0.0506f,0.0000f,0.1875f,0.0938f,0.0000f,0.0000f,-0.0469f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.0938f,0.0000f,0.0000f,-0.0469f,0.0000f,0.0506f,0.0000f,0.1875f,0.0000f,0.0000f,0.0234f,0.0469f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.0000f,0.0000f,-0.0234f,0.0703f,0.0000f,0.0506f,0.0000f,0.1875f,0.0938f,0.0000f,0.0000f,-0.0469f,0.0000f,0.0000f,0.0000f,1.0000f]}]}
execute as @e[tag=celine_Q,scores={celine_Q=1}] at @s run particle dust{color:[0.310,1.000,0.976],scale:1} ~ ~0.1 ~ 0.4 0 0.4 0 10
execute as @e[tag=celine_Q,scores={celine_Q=1}] at @s run playsound minecraft:entity.arrow.hit_player master @a ~ ~ ~ 1 2
execute as @e[tag=celine_Q_display] at @s run tp @s @n[tag=celine_Q]
execute as @e[tag=celine_Q_display] unless entity @e[tag=celine_Q] on passengers run kill @s
execute as @e[tag=celine_Q_display] unless entity @e[tag=celine_Q] run kill @s

# Q 폭탄 마커 지속시간
execute as @e[tag=celine_Q] run scoreboard players add @s celine_Q 1
execute as @e[tag=celine_Q_display] run scoreboard players add @s celine_Q 1
execute as @e[tag=celine_Q_display,scores={celine_Q=100}] on passengers run kill @s
execute as @e[tag=celine_Q_display,scores={celine_Q=100}] run kill @s
execute as @e[tag=celine_Q,scores={celine_Q=100}] at @s run particle minecraft:trial_spawner_detection_ominous ~ ~ ~ 0.2 0.2 0.2 0 10 force
execute as @e[tag=celine_Q,scores={celine_Q=100}] run kill @s


## 쿨타임

execute if entity @s[tag=Fskill,tag=!passive_cool] at @s if entity @e[tag=celine_facing_last] run scoreboard players set @s passive_cool 10

execute if entity @s[tag=passive_cool,scores={passive_level=1,dmgdealt=0..}] run scoreboard players remove @s passive_cool 1
execute if entity @s[tag=passive_cool,scores={passive_level=2,dmgdealt=0..}] run scoreboard players remove @s passive_cool 3
execute if entity @s[tag=passive_cool,scores={passive_level=3,dmgdealt=0..}] run scoreboard players remove @s passive_cool 5
execute if entity @s[tag=passive_cool,scores={passive_level=4,dmgdealt=0..}] run scoreboard players remove @s passive_cool 7
execute if entity @s[tag=passive_cool,scores={passive_level=5,dmgdealt=0..}] run scoreboard players set @s passive_cool 0

scoreboard players reset @s dmgdealt