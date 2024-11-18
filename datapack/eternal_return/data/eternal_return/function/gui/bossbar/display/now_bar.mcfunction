## 루미아 섬 이동 직전 표기
# 입출력 없음
# 상위 함수 : function eternal_return:game/briefing_room
# 남은 시간이 5초 이하인 경우 표기되는 창


## 배경 애니메이션 및 텍스츠 출력
    # 배경 에니메이션 스코어 조정
        # 열림
            execute if score #now.trigger CT1 matches 1 if score #now.bg CT1 matches ..8 run scoreboard players add #now.bg CT1 1
        # 닫힘
            execute if score #now.trigger CT1 matches 2 if score #now.bg CT1 matches 2.. run scoreboard players remove #now.bg CT1 1
        # free
            execute if score #now.trigger CT1 matches 1 if score #now.bg CT1 matches 9 run scoreboard players reset #now.trigger CT1
            execute if score #now.trigger CT1 matches 2 if score #now.bg CT1 matches 1 run scoreboard players reset #now.trigger CT1
        
    # 텍스트
        execute if score #now.bg CT1 matches ..8 run data modify storage temp text set value ""
        execute if score #now.bg CT1 matches 9 run data modify storage temp text set value "곧 루미아 섬으로 이동합니다."

# 보스바에 저장
    function eternal_return:gui/bossbar/display/ui/now_bar with storage pdb:main args

# free
data remove storage temp text