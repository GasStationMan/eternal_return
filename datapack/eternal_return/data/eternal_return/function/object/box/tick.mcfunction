## 상자
# 상위 함수 : function eternal_return:object/tick
# 입출력 없음

# 상자 마커에 selected 태그부여
    execute as @e[type=marker,tag=box_place,tag=!selected] run scoreboard players set @s ct1 600

# 소환 스코어보드
    execute as @e[type=marker,tag=box_place,tag=selected] at @s run function eternal_return:object/box/summon_tick

## 상자 소환 마커 이미지 회전
    execute as @e[tag=box_info_rotate] at @s run tp @s ~ ~ ~ ~5 ~