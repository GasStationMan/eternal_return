##> 게임 시간 타이머
# 입출력 없음
# 상위 함수 : function eternal_return:game/system/in_game
# 맵이 실행될 때부터 경과 시간을 연산하는 함수

## 스코어보드
    # 분 올림
        scoreboard players add #gametime.tick NUM 1
        execute if score #gametime.tick NUM matches 21 run scoreboard players add #gametime.sec NUM 1
        execute if score #gametime.sec NUM matches 60 if score #gametime.min NUM matches ..98 run scoreboard players add #gametime.min NUM 1
    # 초기화
        execute if score #gametime.sec NUM matches 60 run scoreboard players set #gametime.sec NUM 0
        execute if score #gametime.tick NUM matches 21 run scoreboard players set #gametime.tick NUM 1