##> 게임

## 맵
# 타이머
scoreboard players reset #timer.tick CT1
scoreboard players reset #timer.sec CT1
scoreboard players reset #timer.min CT1
scoreboard players reset #timer.halfday CT1
scoreboard players reset #timer.day CT1
# 게임 시간
scoreboard players reset #gametime.tick CT1
scoreboard players reset #gametime.sec CT1
scoreboard players reset #gametime.min CT1
# 기물 초기화
function eternal_return:map/defualt_setting
# 구역 정보 초기화
function eternal_return:map/init
# 서버 메시지 켜기
gamerule sendCommandFeedback true



## 플레이어
# 이팩트
effect clear @a
# 아이템 삭제
clear @a
# 스코어보드
scoreboard players set @a CT3 20
scoreboard players set @a credit 0
scoreboard players set @e ER.resurrection 0
scoreboard players set #give.credit.tick CT1 0
# 도전과제
advancement revoke @a everything
# 태그
tag @a remove ingame_ui
tag @a add remove_bossbar