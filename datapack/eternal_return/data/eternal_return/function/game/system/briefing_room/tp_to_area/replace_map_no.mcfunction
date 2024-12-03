## 최종 좌표배열에 섞인 숫자배열의 값을 순차 입력
# 입력 : warp.temp
# 출력 : map warp.no
# 상위 함수 : function eternal_return:game/briefing_room/tp_to_area

# 반복문
    # 숫자 치환하기
        data modify storage map warp.temp[-1].no set from storage map warp.no[-1]
    
    # 숫자 배열의 마지막 인덱스의 원소 제거
        data remove storage map warp.no[-1]
    # 최종 좌표 배열에 추가
        data modify storage map warp.final append from storage map warp.temp[-1]
    # 임시 좌표 배열에 제거
        data remove storage map warp.temp[-1]

    # 종료 선언
        execute if data storage map warp.no[-1] run function eternal_return:game/system/briefing_room/tp_to_area/replace_map_no