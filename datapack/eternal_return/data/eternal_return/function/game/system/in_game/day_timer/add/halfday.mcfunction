## 낮밤 변경 및 일차별 시간 가져오기
# 상위 함수 : function eternal_return:game/system/in_game/day_timer
# 입출력 : 없음

## 낮밤 변경
    # 낮->밤 / 밤->낮
        execute if score #timer.halfday NUM matches ..2 run scoreboard players add #timer.halfday NUM 1
    # 7일차까지 낮->밤인 경우 => 다음 날로 추가
        execute if score #timer.day NUM matches ..6 if score #timer.halfday NUM matches 3 run scoreboard players add #timer.day NUM 1
        # 태양 아이콘으로 변경
            execute if score #timer.day NUM matches ..6 if score #timer.halfday NUM matches 3 run scoreboard players set #timer.halfday NUM 1

## 일차별 저장된 분/초 설정
    function eternal_return:game/system/in_game/day_timer/get_time_each_day

# 틱 초기화
    scoreboard players set #timer.tick NUM 0