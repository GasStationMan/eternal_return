## 타이머 설정



## 메시지



## 게임 룰
# 서버 메시지 끄기
gamerule sendCommandFeedback false



## 맵
# 구역 초기화
function eternal_return:map/init
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
scoreboard players set #give.credit.tick NUM 1
scoreboard players set @a credit 0
scoreboard players set @e ER.resurrection 0
scoreboard players set @a CT3 20