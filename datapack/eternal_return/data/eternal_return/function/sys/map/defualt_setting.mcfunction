# 키오스크 재소환
function eternal_return:sys/kiosk/remove
function eternal_return:sys/kiosk/set
# 점프패드 재소환
function eternal_return:sys/jumppad/remove
function eternal_return:sys/jumppad/set
# 하이퍼루프 재소환
function eternal_return:sys/hyperloop/remove/phonebooth
function eternal_return:sys/hyperloop/set
# 생명의 나무 제거
function eternal_return:sys/tree_of_life/remove
scoreboard players reset #tree_of_life.summon CT1
# 운석 제거 및 마커 소환
function eternal_return:sys/meteor/remove
function eternal_return:sys/meteor/summon