## 상단 중앙 ui
# 입출력 없음
# 상위 함수 : function eternal_return:game/briefing_room
# 스코어를 텍스트로 변환 후 보스바에 입력

# 숫자 표기 방식 변경
    # 분
        scoreboard players operation #input.number NUM = #timer.min CT1
        function eternal_return:gui/bossbar/display/format_number {type:"two"}
        data modify storage ui_temp temp.time_min set from storage temp format_num
    # 초
        scoreboard players operation #input.number NUM = #timer.sec CT1
        function eternal_return:gui/bossbar/display/format_number {type:"two"}
        data modify storage ui_temp temp.time_sec set from storage temp format_num
    # 팀원 수
        scoreboard players operation #input.number NUM = #game.team CT1
        function eternal_return:gui/bossbar/display/format_number {type:"space"}
        data modify storage ui_temp temp.team set from storage temp format_num
    # 인원 수
        scoreboard players operation #input.number NUM = #game.player CT1
        function eternal_return:gui/bossbar/display/format_number {type:"space"}
        data modify storage ui_temp temp.player set from storage temp format_num
    # 일차
        scoreboard players operation #input.number NUM = #timer.day CT1
        function eternal_return:gui/bossbar/display/format_number {type:"space"}
        data modify storage ui_temp temp.day set from storage temp format_num
    # 금지구역 남은시간
        scoreboard players operation #input.number NUM = @s bantime
        function eternal_return:gui/bossbar/display/format_number {type:"two"}
        data modify storage ui_temp temp.bantime set from storage temp format_num

# 문자열 표기 방식 변경
    # 현재 구역의 상태 받아오기
        data modify storage temp place.name set from storage pdb:main in.place_name
        data modify storage temp place.color set from storage pdb:main in.place_color
        function eternal_return:gui/bossbar/display/format/place_and_color with storage temp place

# 플레이어별 보스바에 변환된 텍스트 입력
    function eternal_return:gui/bossbar/display/ui/interface with storage pdb:main args


# free
    data remove storage temp format_num
    data remove storage ui_temp temp