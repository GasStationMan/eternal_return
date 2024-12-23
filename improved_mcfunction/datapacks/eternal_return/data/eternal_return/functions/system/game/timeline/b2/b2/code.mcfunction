execute if score #timer.sec CT1 matches 30 if score #timer.tick CT1 matches 19 run function eternal_return:system/game/timeline/b2/b2/b1/code
execute if score #timer.sec CT1 matches 59 if score #timer.tick CT1 matches 19 run function eternal_return:send_msg {target:"@a",text:'{"text":"이제 키오스크 사용이 가능합니다."}',color:"gold",timer:1}
