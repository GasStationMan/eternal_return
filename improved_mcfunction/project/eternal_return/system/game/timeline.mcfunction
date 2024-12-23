###### 시스템



score timer_day     is #timer.day CT1
score timer_halfday is #timer.halfday CT1
score timer_sec     is #timer.sec CT1
score timer_tick    is #timer.tick CT1

##   
##   timer_day : 일수 (1일부터 4일까지)
##   timer_halfday : (1 : 낮 2 : 밤)
##   timer_tick    : tick 값 (1/20 sec)
##   timer_sec     : sec 값  (20 tick)
##   
##   
##   
##   
##   
##   
##   

#### 낮밤 변경
if timer_day == 1.. if timer_halfday == 1..2 if timer_sec == 1 if timer_tick == 19 run\
    tag @a add change_daycycle

## 1일차
if timer_day == 1 run goto :
    ## 운석 and 생명의 나무
    if timer_halfday == 2 \
    if timer_sec == 30 \
    if timer_tick == 19 :
        function eternal_return:system/meteor/set
        function eternal_return:system/tree_of_life/set {day:2}

## 2일차
if timer_day == 2 run goto :
    if timer_halfday == 1 run goto :
        if timer_sec     == 30 \
        if timer_tick    == 19 :
            ##알파 출현 예고
            advancement grant @a only eternal_return:alpha_30
            function eternal_return:send_msg {target:"@a",text:'{"text":"알파가 [위치] 지역에 30초 후 출현합니다."}',color:"gold",timer:1}
            ## 전장
            advancement grant @a only eternal_return:battle_zone_30
            function eternal_return:system/map/area/set_type {type:"scheduled_battle_zone"}
        
        ## 키오스크
        if timer_sec == 59 \
        if timer_tick == 19 run\
            function eternal_return:send_msg {target:"@a",text:'{"text":"이제 키오스크 사용이 가능합니다."}',color:"gold",timer:1}


    if timer_halfday == 2 run goto :
        ## 운석 and 생명의 나무
        if timer_sec     == 30 \
        if timer_tick    == 19 :
            function eternal_return:system/meteor/set
            function eternal_return:system/tree_of_life/set {day:3}
        
        ## 알파등장 && 전장
        if timer_sec     == 59 \
        if timer_tick    == 19 :
            advancement grant @a only eternal_return:alpha
            function eternal_return:send_msg {target:"@a",text:'{"text":"알파가 [위치]에 등장했습니다!"}',color:"gold",timer:1}

            advancement grant @a only eternal_return:battle_zone
            function eternal_return:system/map/area/set_type {type:"battle_zone"}

## 3일차 : 오메가 출현예고 ,등장 && 금지 구역, 임시 금지 구역 && 운석
if timer_day == 3 run goto :
    if timer_halfday == 1 run goto :
        if timer_sec == 30 \
        if timer_tick == 19 :
            ## 오메가 출현예고
            function eternal_return:send_msg {target:"@a",text:'{"text":"오메가가 [위치] 지역에 30초 후 출현합니다."}',color:"gold",timer:1}
            advancement grant @a only eternal_return:omega_30
        
        if timer_sec  == 59 \
        if timer_tick == 19 :
            ##금지 구역 지정
            function eternal_return:system/map/area/set_type {type:"restricted_zone"}
            ##임시 금지 구역 지정
            function eternal_return:system/map/area/set_type {type:"scheduled_restricted_zone"}

    if timer_halfday == 2 run goto :
        ## 운석
        if timer_sec     == 30 \
        if timer_tick    == 19 run\
            function eternal_return:system/meteor/set
        
        if timer_sec  == 59 \
        if timer_tick == 19 :
            ## 오메가등장
            advancement grant @a only eternal_return:omega
            function eternal_return:send_msg {target:"@a",text:'{"text":"오메가가 [위치]에 등장했습니다!"}',color:"gold",timer:1}

            ##금지 구역 지정
            function eternal_return:system/map/area/set_type {type:"restricted_zone"}
            ##임시 금지 구역 지정
            function eternal_return:system/map/area/set_type {type:"scheduled_restricted_zone"}

    

## 4일차 && 위클라인 && 금지 구역 지정
if timer_day == 4 run goto :
    if timer_halfday == 1 run goto :
        if timer_sec == 30 \
        if timer_tick == 19 :
            function eternal_return:send_msg {target:"@a",text:'{"text":"30초 후, 위클라인 박사가 등장합니다. 조심하세요!"}',color:"gold",timer:1}
            advancement grant @a only eternal_return:wickeline_30
    
        if timer_sec  == 59 \
        if timer_tick == 19 :
            ##금지 구역 지정
            function eternal_return:system/map/area/set_type {type:"restricted_zone"}
            ##임시 금지 구역 지정
            function eternal_return:system/map/area/set_type {type:"scheduled_restricted_zone"}

    if timer_halfday == 2 run goto :
        if timer_sec == 59 \
        if timer_tick == 19 :
            function eternal_return:send_msg {target:"@a",text:'{"text":"위클라인 박사가 [위치]에서 등장했습니다."}',color:"gold",timer:1}
            advancement grant @a only eternal_return:wickeline
            ##금지 구역 지정
            function eternal_return:system/map/area/set_type {type:"restricted_zone"}
            ##임시 금지 구역 지정
            function eternal_return:system/map/area/set_type {type:"scheduled_restricted_zone"}



## 5일차
if timer_day == 5 run goto :
    if timer_halfday    == 1 run goto :
        if timer_sec        == 29 \
        if timer_tick       == 19 :
            ##금지 구역 지정
            function eternal_return:system/map/area/set_type {type:"restricted_zone"}
            ##임시 금지 구역 지정
            function eternal_return:system/map/area/set_type {type:"scheduled_restricted_zone"}
    
    ## 임시 안전 구역
    if timer_halfday    == 2 run goto :
        if timer_sec        == 29\
        if timer_tick       == 19 :
            ##금지 구역 지정
            function eternal_return:system/map/area/set_type {type:"restricted_zone"}
            ##임시 금지 구역 지정
            function eternal_return:system/map/area/set_type {type:"scheduled_restricted_zone"}
            ##임시 안전지대 설정
            function eternal_return:send_msg {target:"@a",text:'[{"text":"20초 후, 임시 안전지대가 활성화됩니다."}]',color:"gold",timer:1}

## 6일차
if timer_day == 6 run goto :
    if timer_halfday    == 1 run goto :
        if timer_sec        == 29 \
        if timer_tick       == 19 :
            ##금지 구역 지정
            function eternal_return:system/map/area/set_type {type:"restricted_zone"}
            ##안전 구역 비활성화
            function eternal_return:send_msg {target:"@a",text:'[{"text":"임시 안전지대가 종료 되었습니다. 30초후 보안 콘솔 주변이 최종 안전지대로 설정됩니다."}]',color:"gold",timer:1}
    


