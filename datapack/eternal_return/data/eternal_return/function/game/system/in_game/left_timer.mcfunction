##> 게임 시작 5초 전
# 입출력 없음
# 상위 함수 : function eternal_return:game/system/in_game
# 게임 시작 5초전 타이머

## 스코어보드
    # 분 올림
        scoreboard players add #left.time.tick NUM 1
        execute if score #left.time.tick NUM matches 21 run scoreboard players remove #left.time.sec NUM 1
        execute if score #left.time.sec NUM matches 60 if score #gametime.min NUM matches ..98 run scoreboard players add #gametime.min NUM 1
    # 초기화
        execute if score #left.time.sec NUM matches 60 run scoreboard players set #left.time.sec NUM 0
        execute if score #left.time.tick NUM matches 21 run scoreboard players set #left.time.tick NUM 1