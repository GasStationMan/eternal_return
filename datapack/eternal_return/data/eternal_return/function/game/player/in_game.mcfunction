## 인게임
# 입출력 없음
# 상위 함수 : function eternal_return:game/tick


# 플레이어 데이터 불러오기
function pdb:get_me

## 게임 시작 전
    # 상단 UI 표기
        function eternal_return:gui/bossbar/display/interface
    # 중앙 텍스트 표기 UI 스코어 연산
        function eternal_return:gui/bossbar/display/center_bar_tickrate
    # 5초 대기 시
        # 관전모드
            execute if score #left.time.sec NUM matches 5 run effect clear @s resistance
            execute if score #left.time.sec NUM matches 5 run gamemode spectator @s
        # 타이머 표기
        execute if score #left.time.sec NUM matches 1..5 run function eternal_return:gui/bossbar/display/ui/left_timer with storage pdb:main args
        # 게임 시작! 표기
        execute if score #left.time.sec NUM matches -4..0 run function eternal_return:gui/bossbar/display/ui/center_bar with storage pdb:main args
        # centerbar 지우기
        execute if score #left.time.sec NUM matches -5 run function eternal_return:gui/bossbar/display/clear/456 with storage pdb:main args
        
    # 플레이어에게 워프할 구역 배정
        execute if score #left.time.sec NUM matches 7 if score #left.time.tick NUM matches 15 run \
            function eternal_return:game/system/briefing_room/tp_to_area

## 게임 시작    
    # 아이템 지급
        execute if score #left.time.sec NUM matches 0 run function eternal_return:game/player/in_game/start_item
        execute if score #left.time.sec NUM matches 0 run gamemode adventure @s