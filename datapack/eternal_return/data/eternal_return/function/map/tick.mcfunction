## 맵 반복함수
# 상위 함수 : function eternal_return:main
# 입출력 없음
# 맵에 관련된 전반적인 시스템을 다루는 함수

## 플레이어
    # 각 구역 입/퇴장시 태그 설정
        function eternal_return:map/set_tag
        
    # 구역별 이름 개인 스토리지에 저장
    function pdb:get_me
        function eternal_return:map/get_place with storage pdb:main in
    function pdb:save_me


## 구역 설정
# 구역별 상태 반영
#function eternal_return:map/area/tick
# 구역별 맵 플레이어 수 저장
#execute as @e[tag=zplace] run function eternal_return:map/count_player

## 브리핑 룸
#function eternal_return:map/briefing_room/tick