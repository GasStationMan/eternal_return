## 인게임
# 입출력 없음
# 상위 함수 : function eternal_return:game/tick


# 플레이어 데이터 불러오기
function pdb:get_me

# 게임 시작 전
    # 플레이어 위치 고정

    # 상단 UI 표기
        function eternal_return:gui/bossbar/display/interface
    # 남은 타임
        execute if score #late_time_sec CT1 matches 1..5 run function eternal_return:gui/bossbar/display/ui/late_timer with storage pdb:main args
        execute if score #late_time_sec CT1 matches -4..0 run function eternal_return:gui/bossbar/display/ui/center_bar with storage pdb:main args
        execute if score #late_time_sec CT1 matches -5 run function eternal_return:gui/bossbar/display/clear/456 with storage pdb:main args
    # 플레이어에게 워프할 구역 배정
        execute if score #late_time_sec CT1 matches 7 if score #late_time_tick CT1 matches 15 run \
            function eternal_return:game/system/briefing_room/tp_to_area

    