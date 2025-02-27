## 맵 구조물 생성
    
    # 박스 재소환
        function eternal_return:object/box/set_box_marker

    # 키오스크 재소환
        function eternal_return:object/kiosk/remove
        function eternal_return:object/kiosk/set

    # 점프패드 재소환
        function eternal_return:object/jumppad/remove
        function eternal_return:object/jumppad/set

    # 하이퍼루프 재소환
        function eternal_return:object/hyperloop/remove
        function eternal_return:object/hyperloop/set

    # CCTV 재소환
        function eternal_return:object/cctv/remove
        function eternal_return:object/cctv/set

    # 생명의 나무 제거
        function eternal_return:object/tree_of_life/remove
        scoreboard players reset #tree_of_life.summon ct1
    # 운석 제거 및 마커 소환
        function eternal_return:object/meteor/remove
        function eternal_return:object/meteor/summon