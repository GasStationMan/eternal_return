##> 게임 시작 5초 전
# 입출력 없음
# 상위 함수 : function eternal_return:game/system/in_game
# 게임 시작 5초전 타이머

## 스코어보드
    # 분 올림
        scoreboard players add #late_time_tick CT1 1
        execute if score #late_time_tick CT1 matches 21 run scoreboard players remove #late_time_sec CT1 1
        execute if score #late_time_sec CT1 matches 60 if score #gametime.min CT1 matches ..98 run scoreboard players add #gametime.min CT1 1
    # 초기화
        execute if score #late_time_sec CT1 matches 60 run scoreboard players set #late_time_sec CT1 0
        execute if score #late_time_tick CT1 matches 21 run scoreboard players set #late_time_tick CT1 1