## 모델링 소환
$summon armor_stand ~ ~0.05 ~ {NoGravity:1b,Silent:1b,Invisible:1b,Tags:["jumppad",$(place)],ArmorItems:[{},{},{},{id:"minecraft:creeper_banner_pattern",count:1,components:{"minecraft:custom_model_data":9,"minecraft:custom_data":{Tags:$(place)}}}],DisabledSlots:4144959}
# 고개 돌리기
$execute as @e[tag=jumppad,type=armor_stand,distance=..3] at @s run tp @s ~ ~ ~ $(rotation) ~

## 빛 블럭 설치
setblock ~ ~ ~ light[level=8,waterlogged=false]