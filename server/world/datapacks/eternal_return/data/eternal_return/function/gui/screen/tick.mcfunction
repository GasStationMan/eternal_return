## 화면 기능
# 상위 함수 : function eternal_return:main
# 필요 태그 : screen
# 사용 종료 태그 : screen_off
# 키 입력 감지, 화면표기(보스바, 타이틀, 채팅창, 액션바, 아이템 카메라 오버레이), 화면전환(fade 등), 화면 효과(레터박스 등)

## 기능
    # 선택화면 핫바 아이템 고정
        execute if entity @s[tag=screen,tag=!has_blankItem] run function eternal_return:gui/screen/blank_item

    # 키 감지 (W,A,S,D,SPACE,F,Q,Rclick,LClick,SHIFT)
        execute if score @s Page.ct matches 0 run function eternal_return:gui/screen/detect_key

    # 스크롤
        # 선택된 슬롯번호 저장
        execute store result score @s now.scroll.num run data get entity @s SelectedItemSlot

        # 업다운 감지
        execute unless score @s now.scroll.num = @s old.scroll.num if score @s Page.ct matches 0 run \
        function eternal_return:gui/screen/detect_scroll

        # 변경된 슬롯번호 동기화
        execute unless score @s now.scroll.num = @s old.scroll.num run \
        scoreboard players operation @s old.scroll.num = @s now.scroll.num

    # 입력 딜레이 설정
        execute if score @s Page.ct matches 1.. run scoreboard players remove @s Page.ct 1


## 페이지별 표기
        function eternal_return:gui/screen/display


## 화면 기능
    # 화면 전환
        function eternal_return:gui/screen/transition
    # 화면 효과
        function eternal_return:gui/screen/effect


## 스크린 gui 종료 선언
# 필요 태그 : screen_off
    execute if entity @s[tag=screen_off] run function eternal_return:gui/screen/off


# 키 입력 테스트 [DEBUGGING]
    #execute if entity @s[tag=scroll_up] run say up
    #execute if entity @s[tag=scroll_down] run say down
    #execute if entity @s[tag=select_Fkey] run say fkey
    #execute if entity @s[tag=select_Qkey] run say Qkey
    #execute if entity @s[tag=Lclick] run say Lclick
    #execute if entity @s[tag=Rclick] run say Rclick
    #execute if entity @s[tag=Wkey] run say W
    #execute if entity @s[tag=Akey] run say A
    #execute if entity @s[tag=Skey] run say S
    #execute if entity @s[tag=Dkey] run say D
    #execute if entity @s[tag=SPACE] run say SPACE
    #execute if entity @s[tag=SHIFT] run say SHIFT


## 태그 삭제
# 키 감지 함수에서 부여된 태그 삭제
    tag @s remove Wkey
    tag @s remove Akey
    tag @s remove Skey
    tag @s remove Dkey
    tag @s remove SPACE
    tag @s remove SHIFT
    tag @s remove Lclick
    tag @s remove Rclick
    tag @s remove select_Qkey
    tag @s remove select_Fkey
    tag @s remove scroll_up
    tag @s remove scroll_down