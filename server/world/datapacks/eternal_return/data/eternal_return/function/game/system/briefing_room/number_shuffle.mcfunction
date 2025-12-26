## 배열 셔플
# 입력 : #arr.sizeof NUM , #arr.j NUM , map pos_list
# 출력 : map pos_list
# 상위 함수 : function eternal_return:game/briefing_room/tp_to_area

# 반복문
    # 값 저장하기
        execute store result storage temp warp.sizeof int 1 run scoreboard players get #arr.sizeof NUM
    # 무작위 인덱스 선정
        $execute store result score #arr.j NUM run random value 0..$(sizeof)
        execute store result storage temp warp.j int 1 run scoreboard players get #arr.j NUM
    # 선택된 원소들을 교환
        $data modify storage temp warp.temp set from storage temp pos_list[$(sizeof)]
        $data modify storage temp pos_list[$(sizeof)] set from storage temp pos_list[$(j)]
        $data modify storage temp pos_list[$(j)] set from storage temp warp.temp
    # sizeof -= 1
        scoreboard players remove #arr.sizeof NUM 1
    # 종료 선언
        execute if score #arr.sizeof NUM matches 0.. run \
            function eternal_return:game/system/briefing_room/number_shuffle with storage temp warp