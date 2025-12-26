## 일차별 저장된 분/초 설정
# 입출력 : 없음
# 상위 함수 :function eternal_return:game/system/in_game/day_timer/change/halfday

    # 스토리지에 일차/낮밤 저장
        execute store result storage temp day_timer.day int 1 run scoreboard players get #timer.day NUM
        execute store result storage temp day_timer.halfday int 1 run scoreboard players get #timer.halfday NUM
    # 일자별 분/초 가져요기
        function eternal_return:game/system/in_game/day_timer/get_time_each_day/set_min_and_sec with storage temp day_timer
    # free
        data remove storage temp day_timer