#
#   필요 태그 : ER.gui_on
#   사용 종료 태그 : ER.gui_off
#

# 아이디 저장
function eternal_return:temp/input/id


## 기능

    # 선택모드 핫바 변경
        # 플레이어 인벤토리 0~8까지 {tag=selectmod}의 warped_fungus_on_a_stick으로 replace
        execute if entity @s[tag=ER.gui_on,tag=!ER.has_blankItem] run function eternal_return:sys/gui/blank_item
        #return : @p[tag=ER.has_blankItem]

    # 키 입력
        #Q/F/우클릭 감지
        execute if score @s Page.ct matches 0 run function eternal_return:sys/gui/detect_key
        #return : @p[tag=ER.select_Fkey]
        #         @p[tag=ER.select_Qkey]
        #         @p[tag=ER.Rclick]


    # 스크롤
        # 스크롤의 이동 및 감지에 관한 알고리즘
        #
        #
        # 선택된 슬롯번호 저장 -> int temp.now_scorll_num 
        execute store result score #temp.now_scroll_num NUM run data get entity @s SelectedItemSlot

        # 업다운 표기 -> 스크롤 값 벡터가 음수인지 양수인지 판별 -> 위를 향하는 지 밑을 향하는 지 감지
        # #temp.now_scroll_num 과 #temp.old_scroll_num을 비교.
        execute unless score #temp.now_scroll_num NUM = #temp.old_scroll_num NUM if score @s Page.ct matches 0 run \
        function eternal_return:sys/gui/detect_scroll
        #return : @p[tag=ER.scroll_up]
        #return : @p[tag=ER.scroll_down]


        # 변경된 슬롯번호 동기화
        # temp.old_scroll_num을 temp.new_scroll_num값으로 업데이트
        execute unless score #temp.now_scroll_num NUM = #temp.old_scroll_num NUM run \
        scoreboard players operation #temp.old_scroll_num NUM = #temp.now_scroll_num NUM

        # free
        scoreboard players reset now_scroll_num
        scoreboard players reset old_scroll_num


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