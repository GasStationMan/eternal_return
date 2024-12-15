## 브리핑 룸 시스템 변수 조정
# 입출력 없음
# 상위 함수 : function eternal_return:game/tick

##> 게임 시작 전 브리핑 룸
    ## 상단 UI 값 고정
        # 낮밤/분/초/팀원수/플레이어수/금지구역시간
            execute if entity @a[tag=waiting] run function eternal_return:game/system/briefing_room/set_ui_score


    ## 남은시간/대기 플레이어 UI
        # 배경 애니메이션 스코어보드 연산
            execute if score #wait.bg.tick NUM matches 1.. run scoreboard players add #wait.bg.tick NUM 1
            execute if score #wait.bg.tick NUM matches 4.. run scoreboard players add #wait.bg ct1 1
            execute if score #wait.bg ct1 matches 9.. run scoreboard players set #wait.bg ct1 1
            execute if score #wait.bg.tick NUM matches 4.. run scoreboard players set #wait.bg.tick NUM 1
        # 남은 시간 타이머 연산
            execute if score #wait.remaining.tick NUM matches 1.. run scoreboard players add #wait.remaining.tick NUM 1
            execute if score #wait.remaining.tick NUM matches 21.. if score #wait.remaining ct1 matches 1.. run scoreboard players remove #wait.remaining ct1 1
            execute if score #wait.remaining.tick NUM matches 21.. run scoreboard players set #wait.remaining.tick NUM 1
        # 대기 중인 플레이어가 없는 경우
            execute if score #game.player ct1 matches ..9 run scoreboard players set #wait.remaining ct1 120
            execute if score #game.player ct1 matches ..9 run scoreboard players set #wait.remaining.tick NUM 1


    ## "곧 루미아 섬으로 이동" 텍스트 UI

        # 남은 시간이 5초 남았을 때 열리는 애니메이션 재생
            execute if score #wait.remaining ct1 matches 5 run scoreboard players set #now.trigger ct1 1
            execute if score #wait.remaining ct1 matches 6.. run scoreboard players set #now.bg ct1 0
        # 루미아 섬으로 워프시 닫히는 애니메니션 재생
            execute if score #wait.remaining ct1 matches 2 if score #wait.remaining.tick NUM matches 10 run scoreboard players set #now.trigger ct1 2
        # 배경 애니메이션 스코어보드
            function eternal_return:gui/bossbar/display/now_bar_tickrate

    ## 플에이어 수별 UI 스코어 변동
        # 게임시작 5초전 플레이어가 일정수 이상 빠진 경우 남은 시간 120초 고정
            execute if score #wait.remaining ct1 matches 1..5 if score #game.player ct1 matches ..9 run scoreboard players set #wait.remaining ct1 120
        # 플레이어 수가 17명 이상 대기 중인 경우 남은 시간 10초로 스킵
            execute if score #wait.remaining ct1 matches 11.. if score #game.player ct1 matches 17.. run scoreboard players set #wait.remaining ct1 10
    # 아이템 제거
        execute as @e[type=item] if data entity @s Item.components."minecraft:custom_data"{tag:"selectmod"} run kill @s

## 루미아 섬으로 이동
    # 화면 페이드 아웃
        execute if score #wait.remaining ct1 matches 1 if score #wait.remaining.tick NUM matches 1 run title @a times 10t 2s 4t
        execute if score #wait.remaining ct1 matches 1 if score #wait.remaining.tick NUM matches 1 run title @a title {"text":"b","font":"mono_color"}
    
    # 태그 변경
        execute if score #wait.remaining ct1 matches 1 if score #wait.remaining.tick NUM matches 1 run \
            function eternal_return:game/system/briefing_room/starting