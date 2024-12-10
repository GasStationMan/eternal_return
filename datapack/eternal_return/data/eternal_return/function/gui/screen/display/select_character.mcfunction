## 캐릭터 선택화면 요소
#   상위 함수 : function eternal_return:gui/screen/display
#   필요 스코어보드 : Page.num == 1
#   화면 전환 방식 : fade
#
#   입력 가능 키 : W,A,S,D,F,SHIFT
#   사용하는 gui : 보스바, 액션바, 아이템 카메라 오버레이(투구)

## 화면 요소
    # 기능
        # 캐릭터 데이터에서 프레임 배열에 저장된 3줄만 가져오기
            function eternal_return:gui/screen/display/select_character/get_inframe_char
        # 캐릭터 테두리가 선택됨으로 변경
            function eternal_return:gui/screen/display/select_character/change_to_selected_num
        # 화면 프레임 변동 감지 후 변경하기
            function eternal_return:gui/screen/display/select_character/is_scrollable
        # 배열의 정수값을 텍스트 형식으로 변환
            function eternal_return:gui/screen/display/select_character/change_to_text_array

    # 남은시간 (보스바 line1)
        execute if score @s Page.sec matches 1.. run scoreboard players remove @s Page.tick 1
        execute if score @s Page.sec matches 1.. if score @s Page.tick matches ..0 run scoreboard players remove @s Page.sec 1
        execute if score @s Page.sec matches 1.. if score @s Page.tick matches ..0 run scoreboard players add @s Page.tick 20
        # 남은시간이 만료되었을 때
            execute if score @s Page.num matches 1 if score @s Page.sec matches 0 run \
                function eternal_return:gui/screen/display/select_character/goto_next_page

    ## 보스바 (캐릭터 슬롯)
        execute if score @s Page.num matches 1..2 run function eternal_return:gui/screen/display/select_character/bossbar with storage pdb:main args

    ## 액션바 (바로시작 버튼)
        execute if score @s Page.num matches 1 run title @s actionbar [{"text":"4","font":"gui/image","shadow_color":0}]
        execute if score @s Page.num matches 2 run title @s actionbar [{"text":"5","font":"gui/image","shadow_color":0}]

    ## camera_overlay
        # 머리 슬롯 (스크롤 배경)
            function eternal_return:gui/screen/display/select_character/camera_overlay

## 키 입력
    # 캐릭터를 선택 시 (이동 범위 제한 및 버튼 선택)
        execute if score @s Page.num matches 1 run function eternal_return:gui/screen/display/select_character/key
    # 캐릭터를 선택 후 (SHIFT 키로 돌아가기)
        execute if score @s[tag=SHIFT] Page.num matches 2 run scoreboard players set @s Page.num 1
    # 다음 화면으로 전환 (F 키로 캐릭터 선택 및 이동)
        execute if score @s[tag=select_Fkey] Page.num matches 2 if score @s[tag=select_Fkey] Page.ct matches 0 run \
            function eternal_return:gui/screen/display/select_character/goto_next_page