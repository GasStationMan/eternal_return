## 모델링 소환
summon armor_stand ~ ~ ~ {NoGravity:1b,Silent:1b,Invisible:1b,Tags:["hyperloop"],ArmorItems:[{},{},{},{id:"minecraft:creeper_banner_pattern",count:1,components:{"minecraft:custom_model_data":11}}],DisabledSlots:4144959}
# 고개 돌리기
$execute as @e[tag=hyperloop,type=armor_stand,distance=..3] at @s run tp @s ~ ~ ~ $(rotation) ~
# 바닥재 바꾸기
execute as @e[tag=hyperloop,type=armor_stand,distance=..3] at @s run fill ^1 ^-1 ^ ^ ^-1 ^2 minecraft:polished_deepslate

## 방벽 및 빛 블럭 설치
execute as @e[tag=hyperloop,type=armor_stand,distance=..3] at @s run fill ^ ^1 ^ ^1 ^2 ^ barrier
execute as @e[tag=hyperloop,type=armor_stand,distance=..3] at @s run fill ^ ^ ^ ^1 ^ ^ light[level=13,waterlogged=false]

# 반칸 왼쪽으로 이동하기
execute as @e[tag=hyperloop,type=armor_stand,distance=..3] at @s run tp @s ^0.5 ^ ^

## 인터렉션 소환
execute as @e[tag=hyperloop,type=armor_stand,distance=..3] at @s run summon interaction ^ ^ ^0.5 {width:2f,height:3f,Tags:["hyperloop","interaction"]}