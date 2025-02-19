# 폭탄 터질 시 맞은 적 태그 부여
execute as @e[tag=celine_R_t1,tag=celine_R_1,scores={celine_R=20}] at @s run tag @e[distance=..4,tag=!celine_t1] add celine_R1_hit_t1
execute as @e[tag=celine_R_t2,tag=celine_R_1,scores={celine_R=20}] at @s run tag @e[distance=..4,tag=!celine_t2] add celine_R1_hit_t2
execute as @e[tag=celine_R_t3,tag=celine_R_1,scores={celine_R=20}] at @s run tag @e[distance=..4,tag=!celine_t3] add celine_R1_hit_t3
execute as @e[tag=celine_R_t4,tag=celine_R_1,scores={celine_R=20}] at @s run tag @e[distance=..4,tag=!celine_t4] add celine_R1_hit_t4
execute as @e[tag=celine_R_t5,tag=celine_R_1,scores={celine_R=20}] at @s run tag @e[distance=..4,tag=!celine_t5] add celine_R1_hit_t5
execute as @e[tag=celine_R_t6,tag=celine_R_1,scores={celine_R=20}] at @s run tag @e[distance=..4,tag=!celine_t6] add celine_R1_hit_t6
execute as @e[tag=celine_R_t7,tag=celine_R_1,scores={celine_R=20}] at @s run tag @e[distance=..4,tag=!celine_t7] add celine_R1_hit_t7
execute as @e[tag=celine_R_t8,tag=celine_R_1,scores={celine_R=20}] at @s run tag @e[distance=..4,tag=!celine_t8] add celine_R1_hit_t8
execute as @e[tag=celine_R_t9,tag=celine_R_1,scores={celine_R=20}] at @s run tag @e[distance=..4,tag=!celine_t9] add celine_R1_hit_t9
execute as @e[tag=celine_R_t10,tag=celine_R_1,scores={celine_R=20}] at @s run tag @e[distance=..4,tag=!celine_t10] add celine_R1_hit_t10
execute as @e[tag=celine_R_t11,tag=celine_R_1,scores={celine_R=20}] at @s run tag @e[distance=..4,tag=!celine_t11] add celine_R1_hit_t11
execute as @e[tag=celine_R_t12,tag=celine_R_1,scores={celine_R=20}] at @s run tag @e[distance=..4,tag=!celine_t12] add celine_R1_hit_t12
execute as @e[tag=celine_R_t13,tag=celine_R_1,scores={celine_R=20}] at @s run tag @e[distance=..4,tag=!celine_t13] add celine_R1_hit_t13
execute as @e[tag=celine_R_t14,tag=celine_R_1,scores={celine_R=20}] at @s run tag @e[distance=..4,tag=!celine_t14] add celine_R1_hit_t14
execute as @e[tag=celine_R_t15,tag=celine_R_1,scores={celine_R=20}] at @s run tag @e[distance=..4,tag=!celine_t15] add celine_R1_hit_t15
execute as @e[tag=celine_R_t16,tag=celine_R_1,scores={celine_R=20}] at @s run tag @e[distance=..4,tag=!celine_t16] add celine_R1_hit_t16

# 맞은 적에게 데미지
execute if entity @s[tag=celine_t1,scores={active_level=1}] as @e[tag=celine_R1_hit_t1] run damage @s 2 explosion by @e[tag=celine_t1,limit=1]
execute if entity @s[tag=celine_t2,scores={active_level=1}] as @e[tag=celine_R1_hit_t2] run damage @s 2 explosion by @e[tag=celine_t2,limit=1]
execute if entity @s[tag=celine_t3,scores={active_level=1}] as @e[tag=celine_R1_hit_t3] run damage @s 2 explosion by @e[tag=celine_t3,limit=1]
execute if entity @s[tag=celine_t4,scores={active_level=1}] as @e[tag=celine_R1_hit_t4] run damage @s 2 explosion by @e[tag=celine_t4,limit=1]
execute if entity @s[tag=celine_t5,scores={active_level=1}] as @e[tag=celine_R1_hit_t5] run damage @s 2 explosion by @e[tag=celine_t5,limit=1]
execute if entity @s[tag=celine_t6,scores={active_level=1}] as @e[tag=celine_R1_hit_t6] run damage @s 2 explosion by @e[tag=celine_t6,limit=1]
execute if entity @s[tag=celine_t7,scores={active_level=1}] as @e[tag=celine_R1_hit_t7] run damage @s 2 explosion by @e[tag=celine_t7,limit=1]
execute if entity @s[tag=celine_t8,scores={active_level=1}] as @e[tag=celine_R1_hit_t8] run damage @s 2 explosion by @e[tag=celine_t8,limit=1]
execute if entity @s[tag=celine_t9,scores={active_level=1}] as @e[tag=celine_R1_hit_t9] run damage @s 2 explosion by @e[tag=celine_t9,limit=1]
execute if entity @s[tag=celine_t10,scores={active_level=1}] as @e[tag=celine_R1_hit_t10] run damage @s 2 explosion by @e[tag=celine_t10,limit=1]
execute if entity @s[tag=celine_t11,scores={active_level=1}] as @e[tag=celine_R1_hit_t11] run damage @s 2 explosion by @e[tag=celine_t11,limit=1]
execute if entity @s[tag=celine_t12,scores={active_level=1}] as @e[tag=celine_R1_hit_t12] run damage @s 2 explosion by @e[tag=celine_t12,limit=1]
execute if entity @s[tag=celine_t13,scores={active_level=1}] as @e[tag=celine_R1_hit_t13] run damage @s 2 explosion by @e[tag=celine_t13,limit=1]
execute if entity @s[tag=celine_t14,scores={active_level=1}] as @e[tag=celine_R1_hit_t14] run damage @s 2 explosion by @e[tag=celine_t14,limit=1]
execute if entity @s[tag=celine_t15,scores={active_level=1}] as @e[tag=celine_R1_hit_t15] run damage @s 2 explosion by @e[tag=celine_t15,limit=1]
execute if entity @s[tag=celine_t16,scores={active_level=1}] as @e[tag=celine_R1_hit_t16] run damage @s 2 explosion by @e[tag=celine_t16,limit=1]

execute if entity @s[tag=celine_t1,scores={active_level=2}] as @e[tag=celine_R1_hit_t1] run damage @s 3 explosion by @e[tag=celine_t1,limit=1]
execute if entity @s[tag=celine_t2,scores={active_level=2}] as @e[tag=celine_R1_hit_t2] run damage @s 3 explosion by @e[tag=celine_t2,limit=1]
execute if entity @s[tag=celine_t3,scores={active_level=2}] as @e[tag=celine_R1_hit_t3] run damage @s 3 explosion by @e[tag=celine_t3,limit=1]
execute if entity @s[tag=celine_t4,scores={active_level=2}] as @e[tag=celine_R1_hit_t4] run damage @s 3 explosion by @e[tag=celine_t4,limit=1]
execute if entity @s[tag=celine_t5,scores={active_level=2}] as @e[tag=celine_R1_hit_t5] run damage @s 3 explosion by @e[tag=celine_t5,limit=1]
execute if entity @s[tag=celine_t6,scores={active_level=2}] as @e[tag=celine_R1_hit_t6] run damage @s 3 explosion by @e[tag=celine_t6,limit=1]
execute if entity @s[tag=celine_t7,scores={active_level=2}] as @e[tag=celine_R1_hit_t7] run damage @s 3 explosion by @e[tag=celine_t7,limit=1]
execute if entity @s[tag=celine_t8,scores={active_level=2}] as @e[tag=celine_R1_hit_t8] run damage @s 3 explosion by @e[tag=celine_t8,limit=1]
execute if entity @s[tag=celine_t9,scores={active_level=2}] as @e[tag=celine_R1_hit_t9] run damage @s 3 explosion by @e[tag=celine_t9,limit=1]
execute if entity @s[tag=celine_t10,scores={active_level=2}] as @e[tag=celine_R1_hit_t10] run damage @s 3 explosion by @e[tag=celine_t10,limit=1]
execute if entity @s[tag=celine_t11,scores={active_level=2}] as @e[tag=celine_R1_hit_t11] run damage @s 3 explosion by @e[tag=celine_t11,limit=1]
execute if entity @s[tag=celine_t12,scores={active_level=2}] as @e[tag=celine_R1_hit_t12] run damage @s 3 explosion by @e[tag=celine_t12,limit=1]
execute if entity @s[tag=celine_t13,scores={active_level=2}] as @e[tag=celine_R1_hit_t13] run damage @s 3 explosion by @e[tag=celine_t13,limit=1]
execute if entity @s[tag=celine_t14,scores={active_level=2}] as @e[tag=celine_R1_hit_t14] run damage @s 3 explosion by @e[tag=celine_t14,limit=1]
execute if entity @s[tag=celine_t15,scores={active_level=2}] as @e[tag=celine_R1_hit_t15] run damage @s 3 explosion by @e[tag=celine_t15,limit=1]
execute if entity @s[tag=celine_t16,scores={active_level=2}] as @e[tag=celine_R1_hit_t16] run damage @s 3 explosion by @e[tag=celine_t16,limit=1]

execute if entity @s[tag=celine_t1,scores={active_level=3}] as @e[tag=celine_R1_hit_t1] run damage @s 4 explosion by @e[tag=celine_t1,limit=1]
execute if entity @s[tag=celine_t2,scores={active_level=3}] as @e[tag=celine_R1_hit_t2] run damage @s 4 explosion by @e[tag=celine_t2,limit=1]
execute if entity @s[tag=celine_t3,scores={active_level=3}] as @e[tag=celine_R1_hit_t3] run damage @s 4 explosion by @e[tag=celine_t3,limit=1]
execute if entity @s[tag=celine_t4,scores={active_level=3}] as @e[tag=celine_R1_hit_t4] run damage @s 4 explosion by @e[tag=celine_t4,limit=1]
execute if entity @s[tag=celine_t5,scores={active_level=3}] as @e[tag=celine_R1_hit_t5] run damage @s 4 explosion by @e[tag=celine_t5,limit=1]
execute if entity @s[tag=celine_t6,scores={active_level=3}] as @e[tag=celine_R1_hit_t6] run damage @s 4 explosion by @e[tag=celine_t6,limit=1]
execute if entity @s[tag=celine_t7,scores={active_level=3}] as @e[tag=celine_R1_hit_t7] run damage @s 4 explosion by @e[tag=celine_t7,limit=1]
execute if entity @s[tag=celine_t8,scores={active_level=3}] as @e[tag=celine_R1_hit_t8] run damage @s 4 explosion by @e[tag=celine_t8,limit=1]
execute if entity @s[tag=celine_t9,scores={active_level=3}] as @e[tag=celine_R1_hit_t9] run damage @s 4 explosion by @e[tag=celine_t9,limit=1]
execute if entity @s[tag=celine_t10,scores={active_level=3}] as @e[tag=celine_R1_hit_t10] run damage @s 4 explosion by @e[tag=celine_t10,limit=1]
execute if entity @s[tag=celine_t11,scores={active_level=3}] as @e[tag=celine_R1_hit_t11] run damage @s 4 explosion by @e[tag=celine_t11,limit=1]
execute if entity @s[tag=celine_t12,scores={active_level=3}] as @e[tag=celine_R1_hit_t12] run damage @s 4 explosion by @e[tag=celine_t12,limit=1]
execute if entity @s[tag=celine_t13,scores={active_level=3}] as @e[tag=celine_R1_hit_t13] run damage @s 4 explosion by @e[tag=celine_t13,limit=1]
execute if entity @s[tag=celine_t14,scores={active_level=3}] as @e[tag=celine_R1_hit_t14] run damage @s 4 explosion by @e[tag=celine_t14,limit=1]
execute if entity @s[tag=celine_t15,scores={active_level=3}] as @e[tag=celine_R1_hit_t15] run damage @s 4 explosion by @e[tag=celine_t15,limit=1]
execute if entity @s[tag=celine_t16,scores={active_level=3}] as @e[tag=celine_R1_hit_t16] run damage @s 4 explosion by @e[tag=celine_t16,limit=1]

execute if entity @s[tag=celine_t1,scores={active_level=4}] as @e[tag=celine_R1_hit_t1] run damage @s 5 explosion by @e[tag=celine_t1,limit=1]
execute if entity @s[tag=celine_t2,scores={active_level=4}] as @e[tag=celine_R1_hit_t2] run damage @s 5 explosion by @e[tag=celine_t2,limit=1]
execute if entity @s[tag=celine_t3,scores={active_level=4}] as @e[tag=celine_R1_hit_t3] run damage @s 5 explosion by @e[tag=celine_t3,limit=1]
execute if entity @s[tag=celine_t4,scores={active_level=4}] as @e[tag=celine_R1_hit_t4] run damage @s 5 explosion by @e[tag=celine_t4,limit=1]
execute if entity @s[tag=celine_t5,scores={active_level=4}] as @e[tag=celine_R1_hit_t5] run damage @s 5 explosion by @e[tag=celine_t5,limit=1]
execute if entity @s[tag=celine_t6,scores={active_level=4}] as @e[tag=celine_R1_hit_t6] run damage @s 5 explosion by @e[tag=celine_t6,limit=1]
execute if entity @s[tag=celine_t7,scores={active_level=4}] as @e[tag=celine_R1_hit_t7] run damage @s 5 explosion by @e[tag=celine_t7,limit=1]
execute if entity @s[tag=celine_t8,scores={active_level=4}] as @e[tag=celine_R1_hit_t8] run damage @s 5 explosion by @e[tag=celine_t8,limit=1]
execute if entity @s[tag=celine_t9,scores={active_level=4}] as @e[tag=celine_R1_hit_t9] run damage @s 5 explosion by @e[tag=celine_t9,limit=1]
execute if entity @s[tag=celine_t10,scores={active_level=4}] as @e[tag=celine_R1_hit_t10] run damage @s 5 explosion by @e[tag=celine_t10,limit=1]
execute if entity @s[tag=celine_t11,scores={active_level=4}] as @e[tag=celine_R1_hit_t11] run damage @s 5 explosion by @e[tag=celine_t11,limit=1]
execute if entity @s[tag=celine_t12,scores={active_level=4}] as @e[tag=celine_R1_hit_t12] run damage @s 5 explosion by @e[tag=celine_t12,limit=1]
execute if entity @s[tag=celine_t13,scores={active_level=4}] as @e[tag=celine_R1_hit_t13] run damage @s 5 explosion by @e[tag=celine_t13,limit=1]
execute if entity @s[tag=celine_t14,scores={active_level=4}] as @e[tag=celine_R1_hit_t14] run damage @s 5 explosion by @e[tag=celine_t14,limit=1]
execute if entity @s[tag=celine_t15,scores={active_level=4}] as @e[tag=celine_R1_hit_t15] run damage @s 5 explosion by @e[tag=celine_t15,limit=1]
execute if entity @s[tag=celine_t16,scores={active_level=4}] as @e[tag=celine_R1_hit_t16] run damage @s 5 explosion by @e[tag=celine_t16,limit=1]

execute if entity @s[tag=celine_t1,scores={active_level=5}] as @e[tag=celine_R1_hit_t1] run damage @s 6 explosion by @e[tag=celine_t1,limit=1]
execute if entity @s[tag=celine_t2,scores={active_level=5}] as @e[tag=celine_R1_hit_t2] run damage @s 6 explosion by @e[tag=celine_t2,limit=1]
execute if entity @s[tag=celine_t3,scores={active_level=5}] as @e[tag=celine_R1_hit_t3] run damage @s 6 explosion by @e[tag=celine_t3,limit=1]
execute if entity @s[tag=celine_t4,scores={active_level=5}] as @e[tag=celine_R1_hit_t4] run damage @s 6 explosion by @e[tag=celine_t4,limit=1]
execute if entity @s[tag=celine_t5,scores={active_level=5}] as @e[tag=celine_R1_hit_t5] run damage @s 6 explosion by @e[tag=celine_t5,limit=1]
execute if entity @s[tag=celine_t6,scores={active_level=5}] as @e[tag=celine_R1_hit_t6] run damage @s 6 explosion by @e[tag=celine_t6,limit=1]
execute if entity @s[tag=celine_t7,scores={active_level=5}] as @e[tag=celine_R1_hit_t7] run damage @s 6 explosion by @e[tag=celine_t7,limit=1]
execute if entity @s[tag=celine_t8,scores={active_level=5}] as @e[tag=celine_R1_hit_t8] run damage @s 6 explosion by @e[tag=celine_t8,limit=1]
execute if entity @s[tag=celine_t9,scores={active_level=5}] as @e[tag=celine_R1_hit_t9] run damage @s 6 explosion by @e[tag=celine_t9,limit=1]
execute if entity @s[tag=celine_t10,scores={active_level=5}] as @e[tag=celine_R1_hit_t10] run damage @s 6 explosion by @e[tag=celine_t10,limit=1]
execute if entity @s[tag=celine_t11,scores={active_level=5}] as @e[tag=celine_R1_hit_t11] run damage @s 6 explosion by @e[tag=celine_t11,limit=1]
execute if entity @s[tag=celine_t12,scores={active_level=5}] as @e[tag=celine_R1_hit_t12] run damage @s 6 explosion by @e[tag=celine_t12,limit=1]
execute if entity @s[tag=celine_t13,scores={active_level=5}] as @e[tag=celine_R1_hit_t13] run damage @s 6 explosion by @e[tag=celine_t13,limit=1]
execute if entity @s[tag=celine_t14,scores={active_level=5}] as @e[tag=celine_R1_hit_t14] run damage @s 6 explosion by @e[tag=celine_t14,limit=1]
execute if entity @s[tag=celine_t15,scores={active_level=5}] as @e[tag=celine_R1_hit_t15] run damage @s 6 explosion by @e[tag=celine_t15,limit=1]
execute if entity @s[tag=celine_t16,scores={active_level=5}] as @e[tag=celine_R1_hit_t16] run damage @s 6 explosion by @e[tag=celine_t16,limit=1]

# 태그 제거
execute as @e[tag=celine_R1_hit_t1] run tag @s remove celine_R1_hit_t1
execute as @e[tag=celine_R1_hit_t2] run tag @s remove celine_R1_hit_t2
execute as @e[tag=celine_R1_hit_t3] run tag @s remove celine_R1_hit_t3
execute as @e[tag=celine_R1_hit_t4] run tag @s remove celine_R1_hit_t4
execute as @e[tag=celine_R1_hit_t5] run tag @s remove celine_R1_hit_t5
execute as @e[tag=celine_R1_hit_t6] run tag @s remove celine_R1_hit_t6
execute as @e[tag=celine_R1_hit_t7] run tag @s remove celine_R1_hit_t7
execute as @e[tag=celine_R1_hit_t8] run tag @s remove celine_R1_hit_t8
execute as @e[tag=celine_R1_hit_t9] run tag @s remove celine_R1_hit_t9
execute as @e[tag=celine_R1_hit_t10] run tag @s remove celine_R1_hit_t10
execute as @e[tag=celine_R1_hit_t11] run tag @s remove celine_R1_hit_t11
execute as @e[tag=celine_R1_hit_t12] run tag @s remove celine_R1_hit_t12
execute as @e[tag=celine_R1_hit_t13] run tag @s remove celine_R1_hit_t13
execute as @e[tag=celine_R1_hit_t14] run tag @s remove celine_R1_hit_t14
execute as @e[tag=celine_R1_hit_t15] run tag @s remove celine_R1_hit_t15
execute as @e[tag=celine_R1_hit_t16] run tag @s remove celine_R1_hit_t16