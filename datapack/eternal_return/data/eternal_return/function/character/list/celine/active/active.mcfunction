tag @s add celine_skill

# 폭탄 개수 비례해서 마커 생성
execute if score @s[tag=team1] celine_Q_count matches 1 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t1"]}
execute if score @s[tag=team1] celine_Q_count matches 2 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t1"]}
execute if score @s[tag=team1] celine_Q_count matches 3.. at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t1"]}

execute if score @s[tag=team2] celine_Q_count matches 1 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t2"]}
execute if score @s[tag=team2] celine_Q_count matches 2 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t2"]}
execute if score @s[tag=team2] celine_Q_count matches 3.. at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t2"]}

execute if score @s[tag=team3] celine_Q_count matches 1 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t3"]}
execute if score @s[tag=team3] celine_Q_count matches 2 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t3"]}
execute if score @s[tag=team3] celine_Q_count matches 3.. at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t3"]}

execute if score @s[tag=team4] celine_Q_count matches 1 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t4"]}
execute if score @s[tag=team4] celine_Q_count matches 2 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t4"]}
execute if score @s[tag=team4] celine_Q_count matches 3.. at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t4"]}

execute if score @s[tag=team5] celine_Q_count matches 1 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t5"]}
execute if score @s[tag=team5] celine_Q_count matches 2 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t5"]}
execute if score @s[tag=team5] celine_Q_count matches 3.. at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t5"]}

execute if score @s[tag=team6] celine_Q_count matches 1 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t6"]}
execute if score @s[tag=team6] celine_Q_count matches 2 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t6"]}
execute if score @s[tag=team6] celine_Q_count matches 3.. at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t6"]}

execute if score @s[tag=team7] celine_Q_count matches 1 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t7"]}
execute if score @s[tag=team7] celine_Q_count matches 2 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t7"]}
execute if score @s[tag=team7] celine_Q_count matches 3.. at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t7"]}

execute if score @s[tag=team8] celine_Q_count matches 1 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t8"]}
execute if score @s[tag=team8] celine_Q_count matches 2 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t8"]}
execute if score @s[tag=team8] celine_Q_count matches 3.. at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t8"]}

execute if score @s[tag=team9] celine_Q_count matches 1 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t9"]}
execute if score @s[tag=team9] celine_Q_count matches 2 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t9"]}
execute if score @s[tag=team9] celine_Q_count matches 3.. at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t9"]}

execute if score @s[tag=team10] celine_Q_count matches 1 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t10"]}
execute if score @s[tag=team10] celine_Q_count matches 2 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t10"]}
execute if score @s[tag=team10] celine_Q_count matches 3.. at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t10"]}

execute if score @s[tag=team11] celine_Q_count matches 1 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t11"]}
execute if score @s[tag=team11] celine_Q_count matches 2 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t11"]}
execute if score @s[tag=team11] celine_Q_count matches 3.. at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t11"]}

execute if score @s[tag=team12] celine_Q_count matches 1 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t12"]}
execute if score @s[tag=team12] celine_Q_count matches 2 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t12"]}
execute if score @s[tag=team12] celine_Q_count matches 3.. at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t12"]}

execute if score @s[tag=team13] celine_Q_count matches 1 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t13"]}
execute if score @s[tag=team13] celine_Q_count matches 2 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t13"]}
execute if score @s[tag=team13] celine_Q_count matches 3.. at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t13"]}

execute if score @s[tag=team14] celine_Q_count matches 1 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t14"]}
execute if score @s[tag=team14] celine_Q_count matches 2 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t14"]}
execute if score @s[tag=team14] celine_Q_count matches 3.. at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t14"]}

execute if score @s[tag=team15] celine_Q_count matches 1 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t15"]}
execute if score @s[tag=team15] celine_Q_count matches 2 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t15"]}
execute if score @s[tag=team15] celine_Q_count matches 3.. at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t15"]}

execute if score @s[tag=team16] celine_Q_count matches 1 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_1","celine_R_t16"]}
execute if score @s[tag=team16] celine_Q_count matches 2 at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_2","celine_R_t16"]}
execute if score @s[tag=team16] celine_Q_count matches 3.. at @e[tag=celine_facing_last] run summon marker ~ ~ ~ {Tags:["celine_R","celine_R_3","celine_R_t16"]}