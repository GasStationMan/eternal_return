#
#   필요 태그 : 없음
#   




## 화면 전환 효과
    # 전환 시 쿨타임 추가
    execute if score @s[tag=TRAN.fade_in] Page.ct matches 0 run scoreboard players set @s Page.ct 60
    # 전환 중이 아닐 때 시간 고정
    execute if score @s Page.ct matches 0 run title @s times 0 10 0


    # 페이드 인
        execute if entity @s[tag=TRAN.fade_in] run function eternal_return:gui/screen/transition/fade_in
        
    # 슬라이드(미정)



## 전환 중 트리거
    # 보스바
    #execute if score @s Page.ct matches 30 run tag @s add clear_bossbar
    # 액션바 
    execute if score @s Page.ct matches 30 run title @s actionbar ""
    # 타이틀
    execute if score @s Page.ct matches 30 run title @s subtitle ""