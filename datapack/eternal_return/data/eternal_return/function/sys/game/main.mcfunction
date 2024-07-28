##> 게임 타임라인 별 실행 함수


## 게임 진행

# 타임라인
function eternal_return:sys/game/timeline
# 밤낮 바꾸기
function eternal_return:sys/game/timer/change_daycycle
# 타이머
execute if entity @a[tag=game_start] run function eternal_return:sys/game/timer/tick
execute if entity @a[tag=!game_start,tag=wait_bar] run function eternal_return:sys/game/defualt_setting
# 게임시간 타이머
function eternal_return:sys/game/time/tick
# 게임 데이터 집계
function eternal_return:sys/game/total
# 크레딧 지속 지급
function eternal_return:sys/game/give/credit



## 상단 UI 표기
# 초 자릿수 표기
function eternal_return:sys/game/is/tensec
# 플레이어 수 표기
function eternal_return:sys/game/is/player
# 팀 수 표기
function eternal_return:sys/game/is/team
# 일차 수 표기
function eternal_return:sys/game/is/day
# 금지구역 시간 표기
execute as @a[tag=player] at @s run function eternal_return:sys/game/is/bantime

# 대기시간 10의 자리 표기
function eternal_return:sys/game/is/wait_time_tensec
