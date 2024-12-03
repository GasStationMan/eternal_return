## 플레이어 좌표값 가져오기 및 이동
# 입력 : @s pdb:main
# 출력 : @s pdb:main in.warp_pos
# 상위 함수 : function eternal_return:game/briefing_room/tp_to_area 



## 데이터 베이스에 이동할 위치를 지정
    # 플레이어 데이터 불러오기
        function pdb:get_me
    # 이동 지점 세 곳 중 한 곳 정하기
        execute store result storage temp warp.num int 1 run random value 1..3
    # 데이터 가져오기
        function eternal_return:game/system/briefing_room/tp_to_area/get_coordinates with storage temp warp
    # 데이터 저장
        function pdb:save_me
    
    # 부여된 좌표 제거
        data remove storage map warp.final[0]

    # free
        data remove storage temp warp.num

## 이동
    #function eternal_return:map/warp/teleport



