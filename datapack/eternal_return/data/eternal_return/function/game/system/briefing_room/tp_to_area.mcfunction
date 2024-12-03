## 플레이어에게 워프 구역 배정 및 이동
# 입출력 없음
# 상위 함수 : function eternal_return:game/briefing_room

# 스토리지 비우기
    data remove storage map warp

## 배열 섞기
    # 초기설정
        scoreboard players set #arr.sizeof NUM 18
        execute store result storage temp warp.sizeof int 1 run scoreboard players get #arr.sizeof NUM
        scoreboard players set #arr.j NUM 0
        execute store result storage temp warp.j int 1 run scoreboard players get #arr.j NUM
    # 숫자배열 생성
            data modify storage map warp.no set value [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
    # 숫자배열 섞기 (재귀)
        function eternal_return:game/system/briefing_room/tp_to_area/number_shuffle with storage temp warp
    # free
        scoreboard players reset #arr.sizeof NUM
        scoreboard players reset #arr.j NUM
        data remove storage temp warp


## 최종 좌표배열에 섞인 숫자배열의 값을 순차 입력
    # 임시 좌표 배열 생성
        data modify storage map warp.temp set from storage map position
    # 숫자 지정하기
        function eternal_return:game/system/briefing_room/tp_to_area/replace_map_no
    # 18명이 지정되기 때문에 19번째 no의 맵을 제거
        data remove storage map warp.final[{no:19}]


## 플레이어 이동
    execute as @e[tag=waiting] at @s run function eternal_return:game/system/briefing_room/tp_to_area/set_player_position


# free
    data remove storage map warp.no
    data remove storage map warp.temp