## 브리핑 룸 시스템 변수 조정
# 입출력 없음
# 상위 함수 : function eternal_return:game/tick

##> 게임 시작 전 브리핑 룸
    ## 스코어보드
    # 리스폰/부활/낮밤/분/초/팀원수/플레이어수/금지구역시간
        scoreboard players set #game.respawn CT1 0
        scoreboard players set [tag=waiting] resurrection 0
        scoreboard players set #timer.halfday CT1 1
        scoreboard players set #timer.min CT1 0
        scoreboard players set #timer.sec CT1 0
        execute store result score #game.team CT1 if entity @a[tag=waiting]
        execute store result score #game.player CT1 if entity @e[tag=waiting]
        scoreboard players set #timer.day CT1 1
        scoreboard players set @a[tag=waiting] bantime 20

    ## 남은시간/대기 플레이어 UI
        # 배경 애니메이션 스코어보드 연산
            execute if score #wait.bg.tick CT1 matches 1.. run scoreboard players add #wait.bg.tick CT1 1
            execute if score #wait.bg.tick CT1 matches 4.. run scoreboard players add #wait.bg CT1 1
            execute if score #wait.bg CT1 matches 9.. run scoreboard players set #wait.bg CT1 1
            execute if score #wait.bg.tick CT1 matches 4.. run scoreboard players set #wait.bg.tick CT1 1
        # 남은 시간 타이머 연산
            execute if score #wait.remaining.tick CT1 matches 1.. run scoreboard players add #wait.remaining.tick CT1 1
            execute if score #wait.remaining.tick CT1 matches 21.. if score #wait.remaining CT1 matches 1.. run scoreboard players remove #wait.remaining CT1 1
            execute if score #wait.remaining.tick CT1 matches 21.. run scoreboard players set #wait.remaining.tick CT1 1
        # 대기 중인 플레이어가 없는 경우
            execute if score #game.player CT1 matches ..9 run scoreboard players set #wait.remaining CT1 120
            execute if score #game.player CT1 matches ..9 run scoreboard players set #wait.remaining.tick CT1 1

    ## "곧 루미아 섬으로 이동" 텍스트 UI
        # 남은 시간이 5초 남았을 때 열리는 애니메이션 재생
            execute if score #wait.remaining CT1 matches 5 run scoreboard players set #now.trigger CT1 1
            execute if score #wait.remaining CT1 matches 6.. run scoreboard players set #now.bg CT1 0
        # 루미아 섬으로 워프시 닫히는 애니메니션 재생
            execute if score #wait.remaining CT1 matches 1 run scoreboard players set #now.trigger CT1 2

    ## 플에이어 수별 UI 스코어 변동
        # 게임시작 5초전 플레이어가 일정수 이상 빠진 경우 남은 시간 120초 고정
            execute if score #wait.remaining CT1 matches 1..5 if score #game.player CT1 matches ..9 run scoreboard players set #wait.remaining CT1 120
        # 플레이어 수가 17명 이상 대기 중인 경우 남은 시간 10초로 스킵
            execute if score #wait.remaining CT1 matches 11.. if score #game.player CT1 matches 17.. run scoreboard players set #wait.remaining CT1 10


## 루미아 섬으로 이동
    # 화면 페이드 아웃
        execute if score #wait.remaining CT1 matches 1 if score #wait.remaining.tick CT1 matches 1 run title @a times 10t 2s 10t
        execute if score #wait.remaining CT1 matches 1 if score #wait.remaining.tick CT1 matches 2 run title @a title {"text":"1","font":"screen_effect","color":"#4e5c24"}
    
    # 플레이어 지역별 한 명씩 워프

        # 임시 좌표배열
            scoreboard players set #warp.player.count NUM 18
            data modify storage map warp.initial set from storage map position
            