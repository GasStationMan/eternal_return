##> 상단 UI에 표기되는 시간 카운트
# 입출력 없음
# 상위 함수 : function eternal_return:game/system/in_game
# 상단 UI의 타이머 연산 함수

## 스코어보드
    # 낮밤 변경
        execute if score #timer.min NUM matches 0 if score #timer.sec NUM matches 0 if score #timer.tick NUM matches 19 run \
            function eternal_return:game/system/in_game/day_timer/add/halfday
    # 분 내림
        execute if score #timer.min NUM matches 1.. if score #timer.sec NUM matches 0 if score #timer.tick NUM matches 19 run \
            function eternal_return:game/system/in_game/day_timer/add/min
    # 초 내림
        execute if score #timer.tick NUM matches 0.. run scoreboard players add #timer.tick NUM 1 
        execute if score #timer.tick NUM matches 20 if score #timer.sec NUM matches 1.. run scoreboard players remove #timer.sec NUM 1
        execute if score #timer.tick NUM matches 20 run scoreboard players set #timer.tick NUM 1