## 타이머 설정
# 게임시간
function eternal_return:sys/game/time/start
# 타이머
function eternal_return:sys/game/timer/start


## 메시지
function eternal_return:send_msg {target:"@a",text:'{"text":"이터널 리턴은 공정한 게임의 가치를 중요하게 생각합니다."}',color:"gold",timer:0}
function eternal_return:send_msg {target:"@a",text:'{"text":"부당한 티밍은 제재 대상이 될 수 있습니다."}',color:"gold",timer:0}


## 게임 룰
# 서버 메시지 끄기
gamerule sendCommandFeedback false



## 맵
# 기물
function eternal_return:sys/map/defualt_setting
# 구역 초기화
function eternal_return:sys/map/init
# 낮으로 변경
time set day


## 플레이어
# 아이템 지급
function eternal_return:sys/game/give/start_item
# 레시피 해금
function eternal_return:sys/game/give/recipes
# 도전과제 초기화
advancement revoke @a everything
# 스코어보드 초기화
scoreboard players set #give.credit.tick CT1 1
scoreboard players set @a credit 0
scoreboard players set @e ER.resurrection 0
scoreboard players set @a CT3 20