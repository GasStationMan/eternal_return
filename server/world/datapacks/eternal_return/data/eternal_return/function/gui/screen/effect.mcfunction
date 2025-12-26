## 화면 효과
# 입력, 출력 : 없음
# 상위 함수 : function eternal_return:gui/screen/tick
# 사용 종료 태그 : EF.off

    # 래터박스
        execute if entity @s[tag=EF.letterbox] run function eternal_return:gui/screen/effect/letterbox


## 화면 효과 끄기
    execute if entity @s[tag=EF.off] run clear @s carved_pumpkin
    tag @s[tag=EF.off] remove EF.letterbox
    tag @s[tag=EF.off] remove EF.off