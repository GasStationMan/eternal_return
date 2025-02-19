tag @s add celine_skill


execute if entity @s run say 1

# 폭탄 개수 비례해서 마커 생성
execute if score @s[tag=celine_t1] celine_Q_count matches 1 at @e[tag=celine_facing_last_t1] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t1"]}
execute if score @s[tag=celine_t1] celine_Q_count matches 2 at @e[tag=celine_facing_last_t1] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t1"]}
execute if score @s[tag=celine_t1] celine_Q_count matches 3.. at @e[tag=celine_facing_last_t1] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t1"]}

execute if score @s[tag=celine_t2] celine_Q_count matches 1 at @e[tag=celine_facing_last_t2] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t2"]}
execute if score @s[tag=celine_t2] celine_Q_count matches 2 at @e[tag=celine_facing_last_t2] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t2"]}
execute if score @s[tag=celine_t2] celine_Q_count matches 3.. at @e[tag=celine_facing_last_t2] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t2"]}

execute if score @s[tag=celine_t3] celine_Q_count matches 1 at @e[tag=celine_facing_last_t3] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t3"]}
execute if score @s[tag=celine_t3] celine_Q_count matches 2 at @e[tag=celine_facing_last_t3] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t3"]}
execute if score @s[tag=celine_t3] celine_Q_count matches 3.. at @e[tag=celine_facing_last_t3] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t3"]}

execute if score @s[tag=celine_t4] celine_Q_count matches 1 at @e[tag=celine_facing_last_t4] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t4"]}
execute if score @s[tag=celine_t4] celine_Q_count matches 2 at @e[tag=celine_facing_last_t4] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t4"]}
execute if score @s[tag=celine_t4] celine_Q_count matches 3.. at @e[tag=celine_facing_last_t4] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t4"]}

execute if score @s[tag=celine_t5] celine_Q_count matches 1 at @e[tag=celine_facing_last_t5] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t5"]}
execute if score @s[tag=celine_t5] celine_Q_count matches 2 at @e[tag=celine_facing_last_t5] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t5"]}
execute if score @s[tag=celine_t5] celine_Q_count matches 3.. at @e[tag=celine_facing_last_t5] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t5"]}

execute if score @s[tag=celine_t6] celine_Q_count matches 1 at @e[tag=celine_facing_last_t6] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t6"]}
execute if score @s[tag=celine_t6] celine_Q_count matches 2 at @e[tag=celine_facing_last_t6] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t6"]}
execute if score @s[tag=celine_t6] celine_Q_count matches 3.. at @e[tag=celine_facing_last_t6] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t6"]}

execute if score @s[tag=celine_t7] celine_Q_count matches 1 at @e[tag=celine_facing_last_t7] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t7"]}
execute if score @s[tag=celine_t7] celine_Q_count matches 2 at @e[tag=celine_facing_last_t7] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t7"]}
execute if score @s[tag=celine_t7] celine_Q_count matches 3.. at @e[tag=celine_facing_last_t7] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t7"]}

execute if score @s[tag=celine_t8] celine_Q_count matches 1 at @e[tag=celine_facing_last_t8] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t8"]}
execute if score @s[tag=celine_t8] celine_Q_count matches 2 at @e[tag=celine_facing_last_t8] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t8"]}
execute if score @s[tag=celine_t8] celine_Q_count matches 3.. at @e[tag=celine_facing_last_t8] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t8"]}

execute if score @s[tag=celine_t9] celine_Q_count matches 1 at @e[tag=celine_facing_last_t9] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t9"]}
execute if score @s[tag=celine_t9] celine_Q_count matches 2 at @e[tag=celine_facing_last_t9] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t9"]}
execute if score @s[tag=celine_t9] celine_Q_count matches 3.. at @e[tag=celine_facing_last_t9] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t9"]}

execute if score @s[tag=celine_t10] celine_Q_count matches 1 at @e[tag=celine_facing_last_t10] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t10"]}
execute if score @s[tag=celine_t10] celine_Q_count matches 2 at @e[tag=celine_facing_last_t10] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t10"]}
execute if score @s[tag=celine_t10] celine_Q_count matches 3.. at @e[tag=celine_facing_last_t10] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t10"]}

execute if score @s[tag=celine_t11] celine_Q_count matches 1 at @e[tag=celine_facing_last_t11] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t11"]}
execute if score @s[tag=celine_t11] celine_Q_count matches 2 at @e[tag=celine_facing_last_t11] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t11"]}
execute if score @s[tag=celine_t11] celine_Q_count matches 3.. at @e[tag=celine_facing_last_t11] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t11"]}

execute if score @s[tag=celine_t12] celine_Q_count matches 1 at @e[tag=celine_facing_last_t12] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t12"]}
execute if score @s[tag=celine_t12] celine_Q_count matches 2 at @e[tag=celine_facing_last_t12] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t12"]}
execute if score @s[tag=celine_t12] celine_Q_count matches 3.. at @e[tag=celine_facing_last_t12] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t12"]}

execute if score @s[tag=celine_t13] celine_Q_count matches 1 at @e[tag=celine_facing_last_t13] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t13"]}
execute if score @s[tag=celine_t13] celine_Q_count matches 2 at @e[tag=celine_facing_last_t13] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t13"]}
execute if score @s[tag=celine_t13] celine_Q_count matches 3.. at @e[tag=celine_facing_last_t13] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t13"]}

execute if score @s[tag=celine_t14] celine_Q_count matches 1 at @e[tag=celine_facing_last_t14] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t14"]}
execute if score @s[tag=celine_t14] celine_Q_count matches 2 at @e[tag=celine_facing_last_t14] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t14"]}
execute if score @s[tag=celine_t14] celine_Q_count matches 3.. at @e[tag=celine_facing_last_t14] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t14"]}

execute if score @s[tag=celine_t15] celine_Q_count matches 1 at @e[tag=celine_facing_last_t15] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t15"]}
execute if score @s[tag=celine_t15] celine_Q_count matches 2 at @e[tag=celine_facing_last_t15] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t15"]}
execute if score @s[tag=celine_t15] celine_Q_count matches 3.. at @e[tag=celine_facing_last_t15] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t15"]}

execute if score @s[tag=celine_t16] celine_Q_count matches 1 at @e[tag=celine_facing_last_t16] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t16"]}
execute if score @s[tag=celine_t16] celine_Q_count matches 2 at @e[tag=celine_facing_last_t16] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t16"]}
execute if score @s[tag=celine_t16] celine_Q_count matches 3.. at @e[tag=celine_facing_last_t16] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t16"]}