## 게임 시스템 설정
# 상위 함수 : function eternal_return:load


## 날짜별 시간 조정
    data modify storage game init set value {\
    day1:{halfday1:{min:1,sec:30},halfday2:{min:1,sec:30}},\
    day2:{halfday1:{min:1,sec:30},halfday2:{min:1,sec:30}},\
    day3:{halfday1:{min:1,sec:30},halfday2:{min:1,sec:30}},\
    day4:{halfday1:{min:1,sec:0},halfday2:{min:1,sec:30}},\
    day5:{halfday1:{min:1,sec:0},halfday2:{min:1,sec:0}},\
    day6:{halfday1:{min:0,sec:30},halfday2:{min:1,sec:0}}}

## 게임 진행 중
    # 크래딧 지급 간격
        scoreboard players set #credit.tick.value NUM 40
