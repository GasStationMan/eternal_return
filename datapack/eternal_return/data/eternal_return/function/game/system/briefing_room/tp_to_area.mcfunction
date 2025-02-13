## 플레이어에게 워프 구역 배정 및 이동
# 입출력 없음
# 상위 함수 : function eternal_return:game/briefing_room

# 스토리지 비우기
    data remove storage temp warp
# 배열 복제
    data modify storage temp pos_list set from storage map position

## 배열 섞기
    # 초기설정
        scoreboard players set #arr.sizeof NUM 19
        execute store result storage temp warp.sizeof int 1 run scoreboard players get #arr.sizeof NUM
        scoreboard players set #arr.j NUM 0
        execute store result storage temp warp.j int 1 run scoreboard players get #arr.j NUM
    # 좌표배열 섞기 (재귀)
        function eternal_return:game/system/briefing_room/number_shuffle with storage temp warp
        # 16명이 지정되기 때문에 구역 한 곳 제거
            data remove storage temp pos_list[0]
    # free
        scoreboard players reset #arr.sizeof NUM
        scoreboard players reset #arr.j NUM
        data remove storage temp warp

## 섞인 좌표를 플레이어에게 지급
    # 숫자 지정하기
        execute as @a[tag=in_game] run function eternal_return:game/system/briefing_room/assign_coordinate

## 플레이어 이동
    execute as @a[tag=in_game] run function eternal_return:map/warp/teleport

# free
    data remove storage temp pos_list