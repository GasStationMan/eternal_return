## 인게임
# 입출력 없음
# 상위 함수 : function eternal_return:game/tick

## 인게임

    #> 게임 시작전 대기 5초
        # 타이머 스코어보드 연산
            execute if score #left.time.sec NUM matches -5.. run function eternal_return:game/system/in_game/left_timer
        # 플레이어 위치 고정
            execute if score #left.time.sec NUM matches 5 run tag @a add freeze
            execute if score #left.time.sec NUM matches 0 run tag @a add unfreeze

    #> 게임 시작
        # 메시지 출력
            execute if score #left.time.sec NUM matches 0 as @a run \
                function eternal_return:gui/bossbar/display/center_bar {text:'{"text":" 실험이 시작되었습니다. 레이더를 활성화합니다.","font":"gui/centerbar/bar/text"}',sec:5}
        # 게임 시간 초기화
            execute if score #left.time.sec NUM matches 0 if score #left.time.tick NUM matches 1 run \
                scoreboard players set #timer.day NUM 1
            execute if score #left.time.sec NUM matches 0 if score #left.time.tick NUM matches 1 run \
                scoreboard players set #timer.halfday NUM 1
            execute if score #left.time.sec NUM matches 0 if score #left.time.tick NUM matches 1 run \
                function eternal_return:game/system/in_game/day_timer/get_time_each_day
            execute if score #left.time.sec NUM matches 0 if score #left.time.tick NUM matches 2 run \
                scoreboard players set #timer.trigger NUM 1

    #> 상단 UI 타이머
        # 함수 실행 (7일차 밤까지만 실행)
            execute if score #timer.trigger NUM matches 1 if score #timer.day NUM matches ..7 if score #timer.halfday NUM matches ..3 run \
                function eternal_return:game/system/in_game/day_timer