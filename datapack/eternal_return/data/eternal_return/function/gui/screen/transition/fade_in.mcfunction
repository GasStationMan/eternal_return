#
#   필요 태그 : TRAN.fade
#


## 페이드 인
    # 화면 유지 시간 변경
        execute if score @s Page.ct matches 60 run title @s times 10 30 10

    # 검은 화면 표기
        execute if score @s Page.ct matches 60 run title @s title [{"text":"b","font":"mono_color"}]


# 태그 제거
tag @s remove TRAN.fade_in