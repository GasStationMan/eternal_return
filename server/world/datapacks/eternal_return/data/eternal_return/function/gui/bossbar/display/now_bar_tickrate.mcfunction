## "곧 루미아 섬으로 이동합니다" 중앙 UI 배경 애니메이션
# 입출격 없음
# 상위 함수 : function eternal_return:game/briefing_room
# 설명 : 중앙 UI 배경 애니메이션 스코어보드 연산 및 표기


    # 배경 에니메이션 스코어 조정
        # 열림
            execute if score #now.trigger ct1 matches 1 if score #now.bg ct1 matches ..8 run scoreboard players add #now.bg ct1 1
        # 닫힘
            execute if score #now.trigger ct1 matches 2 if score #now.bg ct1 matches 2.. run scoreboard players remove #now.bg ct1 1
        # free
            execute if score #now.trigger ct1 matches 1 if score #now.bg ct1 matches 9 run scoreboard players reset #now.trigger ct1
            execute if score #now.trigger ct1 matches 2 if score #now.bg ct1 matches 1 run scoreboard players reset #now.trigger ct1
        
    # 텍스트
        execute if score #now.bg ct1 matches ..8 run data modify storage temp text set value ""
        execute if score #now.bg ct1 matches 9 run data modify storage temp text set value "곧 루미아 섬으로 이동합니다."
        #data remove storage temp text