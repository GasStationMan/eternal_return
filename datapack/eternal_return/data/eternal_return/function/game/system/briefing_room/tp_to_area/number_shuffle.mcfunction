## 플레이어 이동 위치 지정
# 입력 : #arr.sizeof NUM , #arr.j NUM , map warp.no
# 출력 : map warp.no
# 상위 함수 : function eternal_return:game/briefing_room/tp_to_area

# 반복문
    # 값 저장하기
        execute store result storage temp warp.sizeof int 1 run scoreboard players get #arr.sizeof NUM
    # 무작위 인덱스 선정
        $execute store result score #arr.j NUM run random value 0..$(sizeof)
        execute store result storage temp warp.j int 1 run scoreboard players get #arr.j NUM
    # 선택된 원소들을 교환
        $data modify storage temp warp.temp set from storage map warp.no[$(sizeof)]
        $data modify storage map warp.no[$(sizeof)] set from storage map warp.no[$(j)]
        $data modify storage map warp.no[$(j)] set from storage temp warp.temp
    # sizeof -= 1
        scoreboard players remove #arr.sizeof NUM 1
    # 종료 선언
        execute if score #arr.sizeof NUM matches 0.. run \
            function eternal_return:game/system/briefing_room/tp_to_area/number_shuffle with storage temp warp