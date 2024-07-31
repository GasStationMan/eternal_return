#
#   필요 태그 : ER.gui_on
#   사용 종료 태그 : ER.gui_off
#

# 아이디 저장
function eternal_return:temp/input/id


## 기능

    # 선택모드 핫바 변경
        execute if entity @s[tag=ER.gui_on,tag=!ER.has_blankItem] run function eternal_return:sys/gui/blank_item

    # 키 입력
        execute if score @s Page.ct matches 0 run function eternal_return:sys/gui/detect_key

    # 스크롤
        # 선택된 슬롯번호 저장
        execute store result score #temp.now_scroll_num NUM run data get entity @s SelectedItemSlot

        # 업다운 표기
        execute unless score #temp.now_scroll_num NUM = #temp.now_scroll_num_old NUM if score @s Page.ct matches 0 run \
        function eternal_return:sys/gui/detect_scroll

        # 변경된 슬롯번호 동기화
        execute unless score #temp.now_scroll_num NUM = #temp.now_scroll_num_old NUM run \
        scoreboard players operation #temp.now_scroll_num_old NUM = #temp.now_scroll_num NUM

        # free
        scoreboard players reset now_scroll_num
        scoreboard players reset now_scroll_num_old


    # 입력 딜레이 설정
        execute if score @s Page.ct matches 1.. run scoreboard players remove @s Page.ct 1

    # 플레이어 효과
        effect give @s invisibility infinite 1 true
        effect give @s resistance infinite 100 true



## 스크린
    # 화면 표기
    execute if score @s Page.num matches 0.. run function eternal_return:sys/gui/screen/display
    
    # 화면 전환
    function eternal_return:sys/gui/screen/transition

    # 화면 효과
    function eternal_return:sys/gui/screen/effect

## 종료 선언
    execute if entity @s[tag=ER.gui_off] run function eternal_return:sys/gui/gui_off
        

# 입력 테스트
    execute if entity @s[tag=ER.scroll_up] run say up
    execute if entity @s[tag=ER.scroll_down] run say down
    execute if entity @s[tag=ER.select_Fkey] run say fkey
    execute if entity @s[tag=ER.select_Qkey] run say Qkey
    execute if entity @s[tag=ER.Rclick] run say Rclick



## 태그 삭제
    tag @s remove ER.Rclick
    tag @s remove ER.select_Qkey
    tag @s remove ER.select_Fkey
    tag @s remove ER.scroll_up
    tag @s remove ER.scroll_down

# free
function eternal_return:temp/free/id