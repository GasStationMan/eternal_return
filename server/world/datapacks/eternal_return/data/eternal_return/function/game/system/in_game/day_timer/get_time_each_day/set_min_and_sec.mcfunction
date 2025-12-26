## 일차별 분/초 가져오기
# 입력 : temp day_timer.day, day_timer.halfday
# 출력 : #timer.min NUM / #timer.sec NUM
# 상위 함수 :function eternal_return:game/system/in_game/day_timer/get_time_each_day

# 스토리지에서 가져오기
    $execute store result score #timer.min NUM run data get storage game init.day$(day).halfday$(halfday).min
    $execute store result score #timer.sec NUM run data get storage game init.day$(day).halfday$(halfday).sec
