## 대기 중인 인원 수 표기
# 입출력 없음
# 상위 함수 : function eternal_return:game/briefing_room
# 브리핑 룸에서 대기 중인 플레이어 수와 게임 시작까지 남은 시간 보스바에 표기

# 플레이어 숫자 표기방식 변경
    scoreboard players operation #input.number NUM = #game.player ct1
    function eternal_return:gui/bossbar/display/format_number {type:"space"}
    data modify storage ui_temp temp.player set from storage temp format_num

# 보스바에 저장
    function eternal_return:gui/bossbar/display/ui/wait_bar with storage pdb:main args

# free
data remove storage temp format_num
data remove storage ui_temp temp