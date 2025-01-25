## CCTV 소환
# 상위 함수 : function eternal_return:object/cctv/set
# 입출력 : 없음

# 모델링 소환
    # 아머스탠드 소환 
        summon armor_stand ~ ~ ~ {NoGravity:1b,Silent:1b,Invisible:1b,Tags:["cctv","model","this"],ArmorItems:[{},{},{},{id:"minecraft:creeper_banner_pattern",count:1,components:{"minecraft:custom_model_data":{floats:[0],strings:["cctv"]}}}]}
    # 시선 회전
        $execute as @e[type=armor_stand,tag=cctv,tag=model,distance=..3] at @s run tp @s ~ ~ ~ $(rotate) ~
    # 중앙 맞추기
        execute as @e[type=armor_stand,tag=cctv,tag=model,distance=..3] at @s run tp @s ^-0.5 ^ ^

# 블럭 설치
    # 방벽
        execute as @e[type=armor_stand,tag=cctv,tag=model,distance=..3] at @s run fill ^-0.1 ^1 ^ ^0.1 ^2 ^ barrier
        execute as @e[type=armor_stand,tag=cctv,tag=model,distance=..3] at @s run fill ^-0.1 ^ ^ ^0.1 ^ ^ light

# 인터렉션 소환
        execute as @e[type=armor_stand,tag=cctv,distance=..3] at @s run summon interaction ^ ^ ^ {width:2.2f,height:3f,Tags:["cctv","click_interaction"]}