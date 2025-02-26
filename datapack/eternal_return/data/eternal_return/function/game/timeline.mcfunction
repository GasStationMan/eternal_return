####> 시간별 함수 실행


## 키오스크
execute if score #timer.day NUM matches 1 if score #timer.halfday NUM matches 2 if score #timer.min NUM matches 0 if score #timer.sec NUM matches 0 if score #timer.tick NUM matches 19 \
        run function eternal_return:send_msg {target:"@a",text:'{"text":"이제 키오스크 사용이 가능합니다."}',color:"gold",timer:1}


## 상자
    # 음식 상자
        # 1일차 밤 : 3개
        execute if score #timer.day NUM matches 1 if score #timer.halfday NUM matches 1 if score #timer.min NUM matches 0 if score #timer.sec NUM matches 31 if score #timer.tick NUM matches 19 \
                run function eternal_return:object/box/set_box {type:"food",count:"3"}
        # 2일차 낮 : 3개
        execute if score #timer.day NUM matches 1 if score #timer.halfday NUM matches 2 if score #timer.min NUM matches 0 if score #timer.sec NUM matches 31 if score #timer.tick NUM matches 19 \
                run function eternal_return:object/box/set_box {type:"food",count:"3"}
        # 2일차 밤 : 3개
        execute if score #timer.day NUM matches 2 if score #timer.halfday NUM matches 1 if score #timer.min NUM matches 0 if score #timer.sec NUM matches 31 if score #timer.tick NUM matches 19 \
                run function eternal_return:object/box/set_box {type:"food",count:"2"}
        # 3일차 낮 : 2개
        execute if score #timer.day NUM matches 2 if score #timer.halfday NUM matches 2 if score #timer.min NUM matches 0 if score #timer.sec NUM matches 31 if score #timer.tick NUM matches 19 \
                run function eternal_return:object/box/set_box {type:"food",count:"2"}

    # 영웅 상자
        # 2일차 밤 : 2개
        execute if score #timer.day NUM matches 2 if score #timer.halfday NUM matches 1 if score #timer.min NUM matches 0 if score #timer.sec NUM matches 31 if score #timer.tick NUM matches 19 \
                run function eternal_return:object/box/set_box {type:"epic",count:"2"}
        # 3일차 낮 : 2개
        execute if score #timer.day NUM matches 2 if score #timer.halfday NUM matches 2 if score #timer.min NUM matches 0 if score #timer.sec NUM matches 31 if score #timer.tick NUM matches 19 \
                run function eternal_return:object/box/set_box {type:"epic",count:"2"}
        # 3일차 밤 : 2개
        execute if score #timer.day NUM matches 3 if score #timer.halfday NUM matches 1 if score #timer.min NUM matches 0 if score #timer.sec NUM matches 31 if score #timer.tick NUM matches 19 \
                run function eternal_return:object/box/set_box {type:"epic",count:"2"}
        # 4일차 낮 : 1개
        execute if score #timer.day NUM matches 3 if score #timer.halfday NUM matches 2 if score #timer.min NUM matches 0 if score #timer.sec NUM matches 31 if score #timer.tick NUM matches 19 \
                run function eternal_return:object/box/set_box {type:"epic",count:"1"}

    # 초월 상자
        # 4일차 밤 : 2개
        execute if score #timer.day NUM matches 4 if score #timer.halfday NUM matches 1 if score #timer.min NUM matches 0 if score #timer.sec NUM matches 31 if score #timer.tick NUM matches 19 \
                run function eternal_return:object/box/set_box {type:"mythic",count:"2"}