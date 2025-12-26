## 맵 반복함수
# 상위 함수 : function eternal_return:main
# 입출력 없음
# 맵에 관련된 전반적인 시스템을 다루는 함수

## 플레이어
    # 각 구역 입/퇴장시 태그 설정
        function eternal_return:map/place/set_tag
        
    # 구역별 이름 개인 스토리지에 저장
    function pdb:get_me
        function eternal_return:map/player/get_place with storage pdb:main in
    
    # 다른 구역으로 이동 했을 때
        #execute store result score #temp.now.map.number NUM run data get storage pdb:main in.place_no
        #execute unless score #temp.old.map.number NUM = #temp.now.map.number NUM run \
            function eternal_return:gui/bossbar/display/center_bar {text:'[{"nbt":"in.place_name","storage":"pdb:main","font":"gui/centerbar/bar/text"}]',sec:5}
        #execute unless score #temp.old.map.number NUM = #temp.now.map.number NUM run scoreboard players operation #temp.old.map.number NUM = #temp.now.map.number NUM

    function pdb:save_me


## 구역 설정
# 구역별 상태 반영
#function eternal_return:map/area/tick
# 구역별 맵 플레이어 수 저장
#execute as @e[tag=zplace] run function eternal_return:map/count_player

## 브리핑 룸
#function eternal_return:map/briefing_room/tick