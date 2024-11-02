#
#   사용되는 시점 : 캐릭터를 선택할 때
#   필요 스코어보드 : Page.num == 1
#   화면 전환 방식 : fade
#


## 화면

    # 보스바
    $bossbar set line1.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [{"text":"2","font":"gui/image"}]
    $bossbar set line2.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [{"text":"3","font":"gui/image","color":"#4e5c24"}]
    $bossbar set line3.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [{"text":"캐릭터 선택","font":"gui/font1","color":"blue"}]
    $bossbar set line4.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [{"text":"1 0 0 0 0","font":"gui/image","color":"#4e5c24"}]
    $bossbar set line5.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name ""
    $bossbar set line6.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name ""

    # 액션바
    title @s actionbar ""

    # 타이틀

## 키 입력
    
    # Q key

    # F key

    # Mouse Rclick

    # Mouse Scroll Up

    # Mouse Scroll Down