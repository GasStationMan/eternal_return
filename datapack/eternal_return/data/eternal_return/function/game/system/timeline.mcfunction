####> 시간별 함수 실행


## 키오스크
execute if score #timer.day NUM matches 2 \
    if score #timer.halfday NUM matches 1 \
    if score #timer.sec NUM matches 59 \
    if score #timer.tick NUM matches 19 \
        run function eternal_return:send_msg {target:"@a",text:'{"text":"이제 키오스크 사용이 가능합니다."}',color:"gold",timer:1}