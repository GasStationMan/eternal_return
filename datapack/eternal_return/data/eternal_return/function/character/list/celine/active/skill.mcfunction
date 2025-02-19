scoreboard players add @s celine_R 1
execute as @e[tag=celine_R] run scoreboard players add @s celine_R 1
execute as @e[tag=celine_R_display] run scoreboard players add @s celine_R 1

execute as @e[tag=celine_R_t1,scores={celine_R=1}] at @s run say 1
execute as @e[tag=celine_R_t2,scores={celine_R=1}] at @s run say 2

# 기본폭탄이 궁폭탄 바라보기
execute as @e[tag=celine_R_t1,scores={celine_R=1}] at @s run tp @e[tag=celine_Q_t1] ^ ^ ^ facing entity @s
execute as @e[tag=celine_R_t2,scores={celine_R=1}] at @s run tp @e[tag=celine_Q_t2] ^ ^ ^ facing entity @s
execute as @e[tag=celine_R_t3,scores={celine_R=1}] at @s run tp @e[tag=celine_Q_t3] ^ ^ ^ facing entity @s
execute as @e[tag=celine_R_t4,scores={celine_R=1}] at @s run tp @e[tag=celine_Q_t4] ^ ^ ^ facing entity @s
execute as @e[tag=celine_R_t5,scores={celine_R=1}] at @s run tp @e[tag=celine_Q_t5] ^ ^ ^ facing entity @s
execute as @e[tag=celine_R_t6,scores={celine_R=1}] at @s run tp @e[tag=celine_Q_t6] ^ ^ ^ facing entity @s
execute as @e[tag=celine_R_t7,scores={celine_R=1}] at @s run tp @e[tag=celine_Q_t7] ^ ^ ^ facing entity @s
execute as @e[tag=celine_R_t8,scores={celine_R=1}] at @s run tp @e[tag=celine_Q_t8] ^ ^ ^ facing entity @s
execute as @e[tag=celine_R_t9,scores={celine_R=1}] at @s run tp @e[tag=celine_Q_t9] ^ ^ ^ facing entity @s
execute as @e[tag=celine_R_t10,scores={celine_R=1}] at @s run tp @e[tag=celine_Q_t10] ^ ^ ^ facing entity @s
execute as @e[tag=celine_R_t11,scores={celine_R=1}] at @s run tp @e[tag=celine_Q_t11] ^ ^ ^ facing entity @s
execute as @e[tag=celine_R_t12,scores={celine_R=1}] at @s run tp @e[tag=celine_Q_t12] ^ ^ ^ facing entity @s
execute as @e[tag=celine_R_t13,scores={celine_R=1}] at @s run tp @e[tag=celine_Q_t13] ^ ^ ^ facing entity @s
execute as @e[tag=celine_R_t14,scores={celine_R=1}] at @s run tp @e[tag=celine_Q_t14] ^ ^ ^ facing entity @s
execute as @e[tag=celine_R_t15,scores={celine_R=1}] at @s run tp @e[tag=celine_Q_t15] ^ ^ ^ facing entity @s
execute as @e[tag=celine_R_t16,scores={celine_R=1}] at @s run tp @e[tag=celine_Q_t16] ^ ^ ^ facing entity @s

# 그 상태로 궁폭탄으로 TP
execute as @e[tag=celine_R_t1,scores={celine_R=2}] at @s run tp @e[tag=celine_Q_t1] @s
execute as @e[tag=celine_R_t2,scores={celine_R=2}] at @s run tp @e[tag=celine_Q_t2] @s
execute as @e[tag=celine_R_t3,scores={celine_R=2}] at @s run tp @e[tag=celine_Q_t3] @s
execute as @e[tag=celine_R_t4,scores={celine_R=2}] at @s run tp @e[tag=celine_Q_t4] @s
execute as @e[tag=celine_R_t5,scores={celine_R=2}] at @s run tp @e[tag=celine_Q_t5] @s
execute as @e[tag=celine_R_t6,scores={celine_R=2}] at @s run tp @e[tag=celine_Q_t6] @s
execute as @e[tag=celine_R_t7,scores={celine_R=2}] at @s run tp @e[tag=celine_Q_t7] @s
execute as @e[tag=celine_R_t8,scores={celine_R=2}] at @s run tp @e[tag=celine_Q_t8] @s
execute as @e[tag=celine_R_t9,scores={celine_R=2}] at @s run tp @e[tag=celine_Q_t9] @s
execute as @e[tag=celine_R_t10,scores={celine_R=2}] at @s run tp @e[tag=celine_Q_t10] @s
execute as @e[tag=celine_R_t11,scores={celine_R=2}] at @s run tp @e[tag=celine_Q_t11] @s
execute as @e[tag=celine_R_t12,scores={celine_R=2}] at @s run tp @e[tag=celine_Q_t12] @s
execute as @e[tag=celine_R_t13,scores={celine_R=2}] at @s run tp @e[tag=celine_Q_t13] @s
execute as @e[tag=celine_R_t14,scores={celine_R=2}] at @s run tp @e[tag=celine_Q_t14] @s
execute as @e[tag=celine_R_t15,scores={celine_R=2}] at @s run tp @e[tag=celine_Q_t15] @s
execute as @e[tag=celine_R_t16,scores={celine_R=2}] at @s run tp @e[tag=celine_Q_t16] @s

# 기본 폭탄 제거
execute as @e[tag=celine_R_t1,scores={celine_R=3}] at @s run kill @e[tag=celine_Q_t1]
execute as @e[tag=celine_R_t2,scores={celine_R=3}] at @s run kill @e[tag=celine_Q_t2]
execute as @e[tag=celine_R_t3,scores={celine_R=3}] at @s run kill @e[tag=celine_Q_t3]
execute as @e[tag=celine_R_t4,scores={celine_R=3}] at @s run kill @e[tag=celine_Q_t4]
execute as @e[tag=celine_R_t5,scores={celine_R=3}] at @s run kill @e[tag=celine_Q_t5]
execute as @e[tag=celine_R_t6,scores={celine_R=3}] at @s run kill @e[tag=celine_Q_t6]
execute as @e[tag=celine_R_t7,scores={celine_R=3}] at @s run kill @e[tag=celine_Q_t7]
execute as @e[tag=celine_R_t8,scores={celine_R=3}] at @s run kill @e[tag=celine_Q_t8]
execute as @e[tag=celine_R_t9,scores={celine_R=3}] at @s run kill @e[tag=celine_Q_t9]
execute as @e[tag=celine_R_t10,scores={celine_R=3}] at @s run kill @e[tag=celine_Q_t10]
execute as @e[tag=celine_R_t11,scores={celine_R=3}] at @s run kill @e[tag=celine_Q_t11]
execute as @e[tag=celine_R_t12,scores={celine_R=3}] at @s run kill @e[tag=celine_Q_t12]
execute as @e[tag=celine_R_t13,scores={celine_R=3}] at @s run kill @e[tag=celine_Q_t13]
execute as @e[tag=celine_R_t14,scores={celine_R=3}] at @s run kill @e[tag=celine_Q_t14]
execute as @e[tag=celine_R_t15,scores={celine_R=3}] at @s run kill @e[tag=celine_Q_t15]
execute as @e[tag=celine_R_t16,scores={celine_R=3}] at @s run kill @e[tag=celine_Q_t16]

# 궁폭탄 디스플레이 생성
execute as @e[tag=celine_R,scores={celine_R=4}] at @s run summon block_display ~ ~ ~ {Tags:["celine_R_display"],Passengers:[{id:"minecraft:block_display",block_state:{Name:"minecraft:redstone_lamp",Properties:{lit:"true"}},transformation:[0.3500f,0.0000f,0.0000f,-0.1750f,0.0000f,0.3000f,0.0000f,0.0005f,0.0000f,0.0000f,0.3500f,-0.1750f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:iron_block",Properties:{}},transformation:[0.1000f,0.0000f,0.0000f,-0.0500f,0.0000f,0.2625f,0.0000f,0.0625f,0.0000f,0.0000f,0.0938f,-0.2500f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[-0.0000f,0.0000f,0.4375f,-0.2187f,0.0000f,0.3125f,0.0000f,0.0050f,-0.0425f,0.0000f,-0.0000f,-0.1762f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.0425f,0.0000f,0.0000f,-0.2187f,0.0000f,0.3125f,0.0000f,0.0050f,0.0000f,0.0000f,0.4375f,-0.2187f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.0425f,0.0000f,0.0000f,0.1875f,0.0000f,0.3125f,0.0000f,0.0050f,0.0000f,0.0000f,0.4375f,-0.2187f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[-0.0000f,0.0000f,0.4375f,-0.2187f,0.0000f,0.3125f,0.0000f,0.0050f,-0.0425f,0.0000f,-0.0000f,0.2188f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:iron_block",Properties:{}},transformation:[0.1000f,0.0000f,0.0000f,-0.2500f,0.0000f,0.2625f,0.0000f,0.0625f,0.0000f,0.0000f,0.0938f,-0.0500f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:iron_block",Properties:{}},transformation:[0.1000f,0.0000f,0.0000f,0.1500f,0.0000f,0.2625f,0.0000f,0.0625f,0.0000f,0.0000f,0.0938f,-0.0500f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:iron_block",Properties:{}},transformation:[0.1000f,0.0000f,0.0000f,-0.0500f,0.0000f,0.2625f,0.0000f,0.0625f,0.0000f,0.0000f,0.0938f,0.1563f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:iron_block",Properties:{}},transformation:[0.5000f,0.0000f,0.0000f,-0.2500f,0.0000f,0.0625f,0.0000f,-0.0000f,0.0000f,0.0000f,0.5000f,-0.2500f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.0425f,0.0000f,0.0000f,-0.0200f,0.0000f,0.3125f,0.0000f,0.0050f,0.0000f,0.0000f,0.1563f,-0.2187f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.0000f,0.0000f,0.1563f,-0.2187f,0.0000f,0.3125f,0.0000f,0.0050f,-0.0425f,0.0000f,0.0000f,0.0175f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.0425f,0.0000f,0.0000f,-0.0200f,0.0000f,0.3125f,0.0000f,0.0050f,0.0000f,0.0000f,0.1563f,0.0625f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.0000f,0.0000f,0.1563f,0.0625f,0.0000f,0.3125f,0.0000f,0.0050f,-0.0425f,0.0000f,0.0000f,0.0175f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.1250f,0.0000f,0.0000f,-0.0625f,0.0000f,0.0675f,0.0000f,0.2500f,0.0000f,0.0000f,0.0313f,-0.0937f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.0000f,0.0000f,-0.0313f,-0.0625f,0.0000f,0.0675f,0.0000f,0.2500f,0.1250f,0.0000f,0.0000f,-0.0625f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.1250f,0.0000f,0.0000f,-0.0625f,0.0000f,0.0675f,0.0000f,0.2500f,0.0000f,0.0000f,0.0313f,0.0625f,0.0000f,0.0000f,0.0000f,1.0000f]},{id:"minecraft:block_display",block_state:{Name:"minecraft:gray_concrete",Properties:{}},transformation:[0.0000f,0.0000f,-0.0313f,0.0938f,0.0000f,0.0675f,0.0000f,0.2500f,0.1250f,0.0000f,0.0000f,-0.0625f,0.0000f,0.0000f,0.0000f,1.0000f]}]}
execute as @e[tag=celine_R,scores={celine_R=4}] at @s run function eternal_return:character/list/particle/main
execute as @e[tag=celine_R_display] at @s run tp @s @n[tag=celine_R]

# 사운드 
execute as @e[tag=celine_R,scores={celine_R=1}] at @s run playsound minecraft:item.spyglass.use master @a ~ ~ ~ 2 0.7

execute as @e[tag=celine_R,scores={celine_R=4}] at @s run playsound minecraft:entity.arrow.hit_player master @a ~ ~ ~ 1 0.8
execute as @e[tag=celine_R_2,scores={celine_R=10}] at @s run playsound minecraft:entity.arrow.hit_player master @a ~ ~ ~ 1 1
execute as @e[tag=celine_R_3,scores={celine_R=10}] at @s run playsound minecraft:entity.arrow.hit_player master @a ~ ~ ~ 1 1
execute as @e[tag=celine_R_3,scores={celine_R=16}] at @s run playsound minecraft:entity.arrow.hit_player master @a ~ ~ ~ 1 1.2

execute as @e[tag=celine_R_1,scores={celine_R=20}] at @s run playsound entity.generic.explode master @a ~ ~ ~ 1 2
execute as @e[tag=celine_R_2,scores={celine_R=20}] at @s run playsound entity.generic.explode master @a ~ ~ ~ 1 1
execute as @e[tag=celine_R_3,scores={celine_R=20}] at @s run playsound entity.generic.explode master @a ~ ~ ~ 1 1
execute as @e[tag=celine_R_3,scores={celine_R=20}] at @s run playsound item.mace.smash_ground_heavy master @a ~ ~ ~ 1
execute as @e[tag=celine_R_3,scores={celine_R=20}] at @s run playsound minecraft:block.ender_chest.open master @a ~ ~ ~ 1 0.5

# 파티클
execute as @e[tag=celine_R,scores={celine_R=20}] at @s run particle flash ~ ~0.1 ~ 0 0 0 0 10 force
execute as @e[tag=celine_R_2,scores={celine_R=20}] at @s run particle explosion ~ ~0.1 ~ 0.7 0.7 0.7 0 10 force
execute as @e[tag=celine_R_3,scores={celine_R=20}] at @s run particle explosion ~ ~0.1 ~ 0.7 0.7 0.7 0 10 force
execute as @e[tag=celine_R_3,scores={celine_R=20}] at @s run particle lava ~ ~0.1 ~ 0.7 0.7 0.7 0 50 force

## 데미지
# 1폭
function eternal_return:character/list/celine/active/bomb/bomb_1

# 2폭
function eternal_return:character/list/celine/active/bomb/bomb_2

# 3폭
function eternal_return:character/list/celine/active/bomb/bomb_3

# 폭탄, 마커 제거
execute as @e[tag=celine_R,scores={celine_R=20}] run kill @s
execute as @e[tag=celine_R_display,scores={celine_R=16}] on passengers run kill @s
execute as @e[tag=celine_R_display,scores={celine_R=16}] run kill @s
execute if entity @s[scores={celine_R=20}] run tag @s remove celine_skill


## 쿨타임

# LV 1
execute if entity @s[tag=Qskill,tag=!active_cool] at @s run scoreboard players set @s active_cool 5