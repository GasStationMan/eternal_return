## 캐릭터를 선택하기 전의 플레이어



## 스크롤
    # 선택된 슬롯번호 저장
    execute store result score #temp.now_scroll_num NUM run data get entity @s SelectedItemSlot

    # 업다운 표기
    execute unless score #temp.now_scroll_num NUM = #temp.now_scroll_num_old NUM run \
    function eternal_return:sys/map/briefing_room/waitingplayer/scroll_updown

    # 변경된 슬롯번호 동기화
    execute unless score #temp.now_scroll_num NUM = #temp.now_scroll_num_old NUM run \
    scoreboard players operation #temp.now_scroll_num_old NUM = #temp.now_scroll_num NUM

    ## free
    scoreboard players reset now_scroll_num
    scoreboard players reset now_scroll_num_old
    

## 화면 표시
    # 타이틀 표기시간 조정
    title @s times 0 10 0
    
    # 검은화면 표시
    title @s title {"text":"이터널 리턴에 오신 걸 환영합니다","font":"selectpage/title","color":"#4e5c24"}
    #title @s actionbar {"text":"1","font":"screen_effect","color":"#4e5c24"}


## 선택 모드
    execute if entity @s[tag=select_mod] run function eternal_return:sys/map/briefing_room/waitingplayer/selectmod

    # 플레이어 효과
    execute if entity @s[tag=select_mod] run effect give @s invisibility infinite 1 true
    execute if entity @s[tag=select_mod] run effect give @s resistance infinite 100 true
    
    # 키 입력별 상호작용
    execute if entity @s[tag=scroll_up] run say up
    execute if entity @s[tag=scroll_down] run say down
    execute if entity @s[tag=select_Fkey] run say fkey
    execute if entity @s[tag=select_Qkey] run say Qkey
    execute if entity @s[tag=select_rightclick] run say Rclick


## 태그 삭제
    tag @s remove select_rightclick
    tag @s remove select_Qkey
    tag @s remove select_Fkey
    tag @s remove scroll_up
    tag @s remove scroll_down