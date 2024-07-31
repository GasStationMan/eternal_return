#
#   사용되는 시점 : 게임에 처음 접속할 때
#   필요 스코어보드 : Page.num == 0
#   화면 전환 방식 : fade
#


## 화면

    # 보스바
    $execute if score @s Page.ct matches 0 run bossbar set line1.id$(id) name [{"text":"1","font":"screen_effect"}]
    $execute if score @s Page.ct matches 0 run bossbar set line6.id$(id) name [{"text":"이터널 리턴에 오신걸 환영합니다","font":"gui/title","color":"#4e5c24"}]

    # 액션바
    execute if score @s Page.ct matches 0 run title @s actionbar [{"text":"0","font":"gui/icon"},{"text":"  다음 페이지","font":"gui/actionbar","color":"gray"}]
    

## 키 입력
    
    # Mouse Rclick = 화면 전환
        execute if entity @s[tag=ER.Rclick] run tag @s add TRAN.fade_in
        # 다음 화면 스코어보드로 전환
        execute if score @s Page.ct matches 30 run scoreboard players set @s Page.num 1