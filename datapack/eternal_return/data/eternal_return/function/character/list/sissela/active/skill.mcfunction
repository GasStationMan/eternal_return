scoreboard players add @s sissela_active_skill 1

# 학교
execute if entity @s[tag=school,scores={sissela_active_skill=1}] run tag @e[tag=school,tag=!sissela] add sissela_target

# 소방서
execute if entity @s[tag=fire_station,scores={sissela_active_skill=1}] run tag @e[tag=fire_station,tag=!sissela] add sissela_target

# 주유소
execute if entity @s[tag=gas_station,scores={sissela_active_skill=1}] run tag @e[tag=gas_station,tag=!sissela] add sissela_target

# 양궁장
execute if entity @s[tag=archery_range,scores={sissela_active_skill=1}] run tag @e[tag=archery_range,tag=!sissela] add sissela_target

# 골목길
execute if entity @s[tag=alley,scores={sissela_active_skill=1}] run tag @e[tag=alley,tag=!sissela] add sissela_target

# 경찰서
execute if entity @s[tag=police_station,scores={sissela_active_skill=1}] run tag @e[tag=police_station,tag=!sissela] add sissela_target

# 절
execute if entity @s[tag=temple,scores={sissela_active_skill=1}] run tag @e[tag=temple,tag=!sissela] add sissela_target

# 개울
execute if entity @s[tag=stream,scores={sissela_active_skill=1}] run tag @e[tag=stream,tag=!sissela] add sissela_target

# 연못
execute if entity @s[tag=pond,scores={sissela_active_skill=1}] run tag @e[tag=pond,tag=!sissela] add sissela_target

# 병원
execute if entity @s[tag=hospital,scores={sissela_active_skill=1}] run tag @e[tag=hospital,tag=!sissela] add sissela_target

# 공장
execute if entity @s[tag=factory,scores={sissela_active_skill=1}] run tag @e[tag=factory,tag=!sissela] add sissela_target

# 묘지
execute if entity @s[tag=cemetery,scores={sissela_active_skill=1}] run tag @e[tag=cemetery,tag=!sissela] add sissela_target

# 성당
execute if entity @s[tag=chapel,scores={sissela_active_skill=1}] run tag @e[tag=chapel,tag=!sissela] add sissela_target

# 항구
execute if entity @s[tag=dock,scores={sissela_active_skill=1}] run tag @e[tag=dock,tag=!sissela] add sissela_target

# 창고
execute if entity @s[tag=warehouse,scores={sissela_active_skill=1}] run tag @e[tag=warehouse,tag=!sissela] add sissela_target

# 고급 주택가
execute if entity @s[tag=uptown,scores={sissela_active_skill=1}] run tag @e[tag=uptown,tag=!sissela] add sissela_target

# 숲
execute if entity @s[tag=forest,scores={sissela_active_skill=1}] run tag @e[tag=forest,tag=!sissela] add sissela_target

# 모래사장
execute if entity @s[tag=beach,scores={sissela_active_skill=1}] run tag @e[tag=beach,tag=!sissela] add sissela_target

# 호텔
execute if entity @s[tag=hotel,scores={sissela_active_skill=1}] run tag @e[tag=hotel,tag=!sissela] add sissela_target


execute if entity @s[scores={sissela_active_skill=60,active_level=1}] as @e[tag=sissela_target] run damage @s 1 out_of_world
execute if entity @s[scores={sissela_active_skill=60,active_level=2}] as @e[tag=sissela_target] run damage @s 2 out_of_world
execute if entity @s[scores={sissela_active_skill=60,active_level=3}] as @e[tag=sissela_target] run damage @s 3 out_of_world
execute if entity @s[scores={sissela_active_skill=60,active_level=4}] as @e[tag=sissela_target] run damage @s 4 out_of_world
execute if entity @s[scores={sissela_active_skill=60,active_level=5}] as @e[tag=sissela_target] run damage @s 5 out_of_world

execute if entity @s[scores={sissela_active_skill=60}] as @e[tag=sissela_target] run tag @s remove sissela_target
execute if entity @s[scores={sissela_active_skill=60..}] run tag @s remove sissela_active_skill

execute unless entity @s[tag=sissela_active_skill] run scoreboard players reset @s sissela_active_skill

execute as @e[tag=sissela_target] at @s run particle enchanted_hit ~ ~1 ~ 0.3 0.3 0.3 0 1