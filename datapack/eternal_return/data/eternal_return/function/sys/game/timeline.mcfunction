####> 시간별 함수 실행

### 빈 도전과제 보이기
# 1일차 밤
#execute if score #timer.day CT1 matches 1 if score #timer.halfday CT1 matches 2 if score #timer.sec CT1 matches 59 if score #timer.tick CT1 matches 20 run function eternal_return:sys/advencement/empty {count:3}
# 2일차 낮
#execute if score #timer.day CT1 matches 1 if score #timer.halfday CT1 matches 2 if score #timer.sec CT1 matches 59 if score #timer.tick CT1 matches 20 run function eternal_return:sys/advencement/empty 


### 시스템

## 낮밤 변경
execute if score #timer.day CT1 matches 1.. \
    if score #timer.halfday CT1 matches 1..2 \
    if score #timer.sec CT1 matches 1 \
    if score #timer.tick CT1 matches 19 \
        run tag @a add change_daycycle
## 알파
execute if score #timer.day CT1 matches 2 \
    if score #timer.halfday CT1 matches 1 \
    if score #timer.sec CT1 matches 30 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:send_msg {target:"@a",text:'{"text":"알파가 [위치] 지역에 30초 후 출현합니다."}',color:"gold",timer:1}
execute if score #timer.day CT1 matches 2 \
    if score #timer.halfday CT1 matches 2 \
    if score #timer.sec CT1 matches 59 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:send_msg {target:"@a",text:'{"text":"알파가 [위치]에 등장했습니다!"}',color:"gold",timer:1}

execute if score #timer.day CT1 matches 2 \
    if score #timer.halfday CT1 matches 1 \
    if score #timer.sec CT1 matches 30 \
    if score #timer.tick CT1 matches 19 \
        run advancement grant @a only eternal_return:alpha_30
execute if score #timer.day CT1 matches 2 \
    if score #timer.halfday CT1 matches 2 \
    if score #timer.sec CT1 matches 59 \
    if score #timer.tick CT1 matches 19 \
        run advancement grant @a only eternal_return:alpha
## 오메가
execute if score #timer.day CT1 matches 3 \
    if score #timer.halfday CT1 matches 1 \
    if score #timer.sec CT1 matches 30 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:send_msg {target:"@a",text:'{"text":"오메가가 [위치] 지역에 30초 후 출현합니다."}',color:"gold",timer:1}
execute if score #timer.day CT1 matches 3 \
    if score #timer.halfday CT1 matches 2 \
    if score #timer.sec CT1 matches 59 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:send_msg {target:"@a",text:'{"text":"오메가가 [위치]에 등장했습니다!"}',color:"gold",timer:1}

execute if score #timer.day CT1 matches 3 \
    if score #timer.halfday CT1 matches 1 \
    if score #timer.sec CT1 matches 30 \
    if score #timer.tick CT1 matches 19 \
        run advancement grant @a only eternal_return:omega_30
execute if score #timer.day CT1 matches 3 \
    if score #timer.halfday CT1 matches 2 \
    if score #timer.sec CT1 matches 59 \
    if score #timer.tick CT1 matches 19 \
        run advancement grant @a only eternal_return:omega
## 위클라인
execute if score #timer.day CT1 matches 4 \
    if score #timer.halfday CT1 matches 1 \
    if score #timer.sec CT1 matches 30 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:send_msg {target:"@a",text:'{"text":"30초 후, 위클라인 박사가 등장합니다. 조심하세요!"}',color:"gold",timer:1}
execute if score #timer.day CT1 matches 4 \
    if score #timer.halfday CT1 matches 2 \
    if score #timer.sec CT1 matches 59 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:send_msg {target:"@a",text:'{"text":"위클라인 박사가 [위치]에서 등장했습니다."}',color:"gold",timer:1}

execute if score #timer.day CT1 matches 4 \
    if score #timer.halfday CT1 matches 1 \
    if score #timer.sec CT1 matches 30 \
    if score #timer.tick CT1 matches 19 \
        run advancement grant @a only eternal_return:wickeline_30
execute if score #timer.day CT1 matches 4 \
    if score #timer.halfday CT1 matches 2 \
    if score #timer.sec CT1 matches 59 \
    if score #timer.tick CT1 matches 19 \
        run advancement grant @a only eternal_return:wickeline
## 생명의나무
execute if score #timer.day CT1 matches 1 \
    if score #timer.halfday CT1 matches 2 \
    if score #timer.sec CT1 matches 30 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:sys/tree_of_life/set {day:2}
execute if score #timer.day CT1 matches 2 \
    if score #timer.halfday CT1 matches 2 \
    if score #timer.sec CT1 matches 30 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:sys/tree_of_life/set {day:3}
## 운석
execute if score #timer.day CT1 matches 1..3 \
    if score #timer.halfday CT1 matches 2 \
    if score #timer.sec CT1 matches 30 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:sys/meteor/set

## 전장
execute if score #timer.day CT1 matches 2 \
    if score #timer.halfday CT1 matches 1 \
    if score #timer.sec CT1 matches 30 \
    if score #timer.tick CT1 matches 19 \
        run advancement grant @a only eternal_return:battle_zone_30
execute if score #timer.day CT1 matches 2 \
    if score #timer.halfday CT1 matches 1 \
    if score #timer.sec CT1 matches 30 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:map/area/set_type {type:"scheduled_battle_zone"}
execute if score #timer.day CT1 matches 2 \
    if score #timer.halfday CT1 matches 2 \
    if score #timer.sec CT1 matches 59 \
    if score #timer.tick CT1 matches 19 \
        run advancement grant @a only eternal_return:battle_zone
execute if score #timer.day CT1 matches 2 \
    if score #timer.halfday CT1 matches 2 \
    if score #timer.sec CT1 matches 59 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:map/area/set_type {type:"battle_zone"}
## 키오스크
execute if score #timer.day CT1 matches 2 \
    if score #timer.halfday CT1 matches 1 \
    if score #timer.sec CT1 matches 59 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:send_msg {target:"@a",text:'{"text":"이제 키오스크 사용이 가능합니다."}',color:"gold",timer:1}
## 보안콘솔(CCTV) 



## 금지구역

# 금지 구역 지정
# 3~4일차
execute if score #timer.day CT1 matches 3..4 \
    if score #timer.halfday CT1 matches 1..2 \
    if score #timer.sec CT1 matches 59 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:map/area/set_type {type:"restricted_zone"}
# 5일차
execute if score #timer.day CT1 matches 5 \
    if score #timer.halfday CT1 matches 1..2 \
    if score #timer.sec CT1 matches 29 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:map/area/set_type {type:"restricted_zone"}
# 6일차
execute if score #timer.day CT1 matches 6 \
    if score #timer.halfday CT1 matches 1 \
    if score #timer.sec CT1 matches 29 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:map/area/set_type {type:"restricted_zone"}
# 임시 금지 구역 지정
# 3~4일차
execute if score #timer.day CT1 matches 3..4 \
    if score #timer.halfday CT1 matches 1..2 \
    if score #timer.sec CT1 matches 59 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:map/area/set_type {type:"scheduled_restricted_zone"}
# 5일차
execute if score #timer.day CT1 matches 5 \
    if score #timer.halfday CT1 matches 1..2 \
    if score #timer.sec CT1 matches 29 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:map/area/set_type {type:"scheduled_restricted_zone"}
#

## 임시 안전 구역
# 활성화
execute if score #timer.day CT1 matches 5 \
    if score #timer.halfday CT1 matches 2 \
    if score #timer.sec CT1 matches 29 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:send_msg {target:"@a",text:'[{"text":"20초 후, 임시 안전지대가 활성화됩니다."}]',color:"gold",timer:1}
# 비활성화
execute if score #timer.day CT1 matches 6 \
    if score #timer.halfday CT1 matches 1 \
    if score #timer.sec CT1 matches 29 \
    if score #timer.tick CT1 matches 19 \
        run function eternal_return:send_msg {target:"@a",text:'[{"text":"임시 안전지대가 종료 되었습니다. 30초후 보안 콘솔 주변이 최종 안전지대로 설정됩니다."}]',color:"gold",timer:1}