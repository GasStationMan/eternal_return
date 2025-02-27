## 중앙 텍스트 UI 표기시간 설정
# 입출격 없음
# 상위 함수 : function eternal_return:game/player/in_game
# 설명 : 중앙 텍스트 UI 표기 시간에 관한 스코어보드 설정


## 스코어보드
    # 입력받은 틱 -1
        execute if score @s centerbar.sec matches 1.. run scoreboard players add @s centerbar.tick 1
    # 초 -1
        execute if score @s centerbar.sec matches 1.. if score @s centerbar.tick matches 20 run scoreboard players remove @s centerbar.sec 1
    # 틱 0으로 초기화
        execute if score @s centerbar.tick matches 20 run scoreboard players set @s centerbar.tick 0
        # UI 끄기
            execute if score @s centerbar.sec matches 0 run function eternal_return:gui/bossbar/display/clear/line2 with storage pdb:main args
            execute if score @s centerbar.sec matches 0 run function eternal_return:gui/bossbar/display/clear/line3 with storage pdb:main args