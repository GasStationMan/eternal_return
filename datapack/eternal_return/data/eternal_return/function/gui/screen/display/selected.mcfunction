## 캐릭터를 선택한 후
# 상위 함수 : function eternal_return:gui/screen/display
# 사용되는 시점 : 캐릭터를 선택한 후 이동
# 필요 스코어보드 : page.num == 3
# 화면 전환 방식 : fade
# 캐릭터 선택 후 브리핑 룸 이동 및 스크린 종료 

## 화면
    # 보스바
        $execute if score @s Page.ct matches 20 run bossbar set line1.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name ""
        $execute if score @s Page.ct matches 20 run bossbar set line2.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name ""
        $execute if score @s Page.ct matches 20 run bossbar set line3.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name ""
        $execute if score @s Page.ct matches 20 run bossbar set line4.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name ""
        $execute if score @s Page.ct matches 20 run bossbar set line5.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name ""
        $execute if score @s Page.ct matches 20 run bossbar set line6.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name ""

## 부가 기능
    # 브리핑 룸으로 이동
        spreadplayers -293 448 3 30 under 63 false @s[tag=frist_join]
    # 태그
        execute if score @s Page.ct matches 1 run tag @s add waiting
        tag @s remove frist_join
    # 갑옷 슬롯 제거
        execute if score @s Page.ct matches 20 run clear @s paper
    # 게임모드 변경
        execute if score @s Page.ct matches 1 run gamemode adventure @s
    # 화면 종료
        execute if score @s Page.ct matches 1 run tag @s add screen_off