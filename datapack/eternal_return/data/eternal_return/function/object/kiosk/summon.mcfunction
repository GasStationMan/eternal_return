## 모델링 소환
    # 아미스텐드 소환
        summon armor_stand ~ ~ ~ {NoGravity:1b,Silent:1b,Invisible:1b,Tags:["kiosk","model"],ArmorItems:[{},{},{},{id:"minecraft:creeper_banner_pattern",count:1,components:{"minecraft:custom_model_data":{strings:["kiosk"]}}}],DisabledSlots:4144959}
    # 고개 돌리기
        $execute as @e[tag=kiosk,type=armor_stand,distance=..3] at @s run tp @s ~ ~ ~ $(rotation) ~
    # 바닥재 바꾸기
        execute as @e[tag=kiosk,type=armor_stand,distance=..3] at @s run fill ^1 ^-1 ^ ^-1 ^-1 ^1 polished_andesite
    # 인터랙션
        summon interaction ~ ~ ~ {width:1.1f,height:2f,Tags:["kiosk","click_interaction"]}

## 방벽 및 빛 블럭 설치
    setblock ~ ~1 ~ barrier
    setblock ~ ~ ~ light[level=8,waterlogged=false]

