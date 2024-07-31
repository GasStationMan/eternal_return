

## 플레이어 아이디 넘버링
    # 저장 값 카운트 +1
    scoreboard players add #player_id_count player_id 1
    # 플레이어 아이디 부여
    scoreboard players operation @s player_id = #player_id_count player_id

## 플레이어 기초 데이터
    # 태그 부여
        tag @s add first_join
        tag @s add player
        tag @s add ER.gui_on

    # 스코어보드 설정
        # 페이지 
        scoreboard players set @s Page.slot 0
        scoreboard players set @s Page.ct 0
        scoreboard players set @s Page.num 0
        # 슬롯 저장
        execute store result score #temp.now_scroll_num NUM run data get entity @s SelectedItemSlot



# 아이디 저장
function eternal_return:temp/input/id

    # 개인 스토리지 생성
    function eternal_return:sys/player/input_data with storage player_data temp[0]

    # 보스바 생성 및 표기
    function eternal_return:sys/bossbar/set/add with storage player_data temp[0]
    function eternal_return:sys/bossbar/set/show with storage player_data temp[0]

# free
function eternal_return:temp/free/id