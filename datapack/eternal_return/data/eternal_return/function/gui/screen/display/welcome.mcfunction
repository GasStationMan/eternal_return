## 첫 입장시 선택화면
#   사용되는 시점 : 게임에 처음 접속할 때
#   필요 스코어보드 : Page.num == 0
#   화면 전환 방식 : fade
#

# 갑옷슬롯 지우기
clear @s paper

## 화면 구성
    # 보스바
        $execute if score @s Page.ct matches 0 run bossbar set line1.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [{"text":"1","font":"screen_effect"}]
        $execute if score @s Page.ct matches 0 run bossbar set line2.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name ""
        $execute if score @s Page.ct matches 0 run bossbar set line3.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name ""
        $execute if score @s Page.ct matches 0 run bossbar set line4.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name ""
        $execute if score @s Page.ct matches 0 run bossbar set line5.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name ""
        $execute if score @s Page.ct matches 0 run bossbar set line6.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [{"text":"이터널 리턴에 오신걸 환영합니다","font":"gui/title"}]

    # 액션바
        execute if score @s Page.ct matches 0 run title @s actionbar [{"text":"0","font":"gui/icon"},{"text":"  다음 페이지","font":"gui/actionbar","color":"gray"}]

## 키 입력
    # Mouse Rclick = 화면 전환
        execute if entity @s[tag=Rclick] run function eternal_return:gui/screen/display/select_character/set_char_data
        execute if entity @s[tag=Rclick] run tag @s add TRAN.fade_in


## 다음 화면 스코어보드로 전환
        # 페이지 넘기기
            execute if score @s Page.ct matches 30 run scoreboard players set @s Page.num 1
        # 남은시간 30초
            execute if score @s Page.ct matches 30 run scoreboard players set @s Page.sec 30
        # 캐릭터 슬롯 0
            execute if score @s Page.ct matches 30 run scoreboard players set @s Page.slot 0
        # 프레임 수 0
            execute if score @s Page.ct matches 30 run scoreboard players set @s Page.frame 0