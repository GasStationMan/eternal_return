## CCTV
# 상위 함수 : function eternal_return:object/tick
# 입출력 없음
# CCTV에 관한 모든 걸 관리하는 tick 함수

# 소환 
#summon armor_stand ~ ~ ~ {Tags:["cctv"],ArmorItems:[{},{},{},{id:"minecraft:creeper_banner_pattern",count:1,components:{"minecraft:custom_model_data":{floats:[4],strings:["cctv"]}}}]}
# 모드 변경

# 모드 종류
# custom_model_data => strings:"cctv", floats: 0~4
# 0: 켜진 상태 / 1: 작동 중 / 2: 쿨타임 / 3: 꺼진상태
#execute as @e[tag=cctv,type=armor_stand] store result entity @s ArmorItems[3].components."minecraft:custom_model_data".floats[0] float 1 run scoreboard players set @s NUM 0