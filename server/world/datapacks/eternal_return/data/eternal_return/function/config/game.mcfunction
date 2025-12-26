## 게임 시스템 설정
# 상위 함수 : function eternal_return:load


## 날짜별 시간 조정
    data modify storage game init set value {\
    day1:{halfday1:{min:1,sec:1},halfday2:{min:1,sec:2}},\
    day2:{halfday1:{min:1,sec:3},halfday2:{min:1,sec:4}},\
    day3:{halfday1:{min:1,sec:5},halfday2:{min:1,sec:6}},\
    day4:{halfday1:{min:1,sec:7},halfday2:{min:1,sec:8}},\
    day5:{halfday1:{min:1,sec:9},halfday2:{min:1,sec:10}},\
    day6:{halfday1:{min:1,sec:11},halfday2:{min:1,sec:12}},\
    day7:{halfday1:{min:1,sec:13},halfday2:{min:1,sec:14}},\
    }

## 게임 진행 중
    # 크래딧
        # 자동 지급 간격 
            scoreboard players set #credit.tick.value NUM 40
        # 게임시작 크레딧 지급 15
    

    # 폭발 타이머 (금구)
        # 최대값 35초
        # 시작시 25초
        # 킬 할때 8초 추가 (6일차 낮부터)