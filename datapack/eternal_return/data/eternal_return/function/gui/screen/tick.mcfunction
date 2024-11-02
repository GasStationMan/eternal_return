#
#   필요 태그 : screen
#   사용 종료 태그 : screen_off
#

## 기능
function pdb:get_me
    # 선택모드 핫바 변경
        execute if entity @s[tag=screen,tag=!has_blankItem] run function eternal_return:gui/screen/blank_item

    # 키 감지 (W,A,S,D,SPACE,F,Q,Rclick,LClick,SHIFT)
        execute if score @s Page.ct matches 0 run function eternal_return:gui/detect_key

    # 스크롤
        # 선택된 슬롯번호 저장
        execute store result score @s now_scroll_num run data get entity @s SelectedItemSlot

        # 업다운 표기
        execute unless score @s now_scroll_num = @s old_scroll_num if score @s Page.ct matches 0 run \
        function eternal_return:gui/screen/detect_scroll

        # 변경된 슬롯번호 동기화
        execute unless score @s now_scroll_num = @s old_scroll_num run \
        scoreboard players operation @s old_scroll_num = @s now_scroll_num

    # 입력 딜레이 설정
        execute if score @s Page.ct matches 1.. run scoreboard players remove @s Page.ct 1



## 스크린
    # 화면 표기
    execute if score @s Page.num matches 0.. run function eternal_return:gui/screen/display
    
    # 화면 전환
    function eternal_return:gui/screen/transition

    # 화면 효과
    function eternal_return:gui/screen/effect

## 종료 선언
    execute if entity @s[tag=screen_off] run function eternal_return:gui/screen/off


# 입력 DEBUGGING
    execute if entity @s[tag=scroll_up] run say up
    execute if entity @s[tag=scroll_down] run say down
    execute if entity @s[tag=select_Fkey] run say fkey
    execute if entity @s[tag=select_Qkey] run say Qkey
    execute if entity @s[tag=Lclick] run say Lclick
    execute if entity @s[tag=Rclick] run say Rclick
    execute if entity @s[tag=Wkey] run say W
    execute if entity @s[tag=Akey] run say A
    execute if entity @s[tag=Skey] run say S
    execute if entity @s[tag=Dkey] run say D
    execute if entity @s[tag=SPACE] run say SPACE
    execute if entity @s[tag=SHIFT] run say SHIFT


## 태그 삭제
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