## 새로운 플레이어 DB 추가
function pdb:new_player
function pdb:get_me

 # 플레이어 초기 데이터
    # 태그 부여
        tag @s add frist_join
        tag @s add player
        tag @s add screen
    
    # 태그 삭제
        tag @s remove waiting

    # 스코어보드 설정
        # 페이지
        scoreboard players set @s Page.frame 0
        scoreboard players set @s Page.slot 1
        scoreboard players set @s Page.ct 0
        scoreboard players set @s Page.num 0
        # 슬롯 저장
        execute store result score #temp.now_scroll_num NUM run data get entity @s SelectedItemSlot

    # 보스바 생성 및 표기
        function eternal_return:gui/bossbar/new with storage pdb:main args
        function eternal_return:gui/bossbar/show with storage pdb:main args

    # 캐릭터 추가 test data
        execute unless data storage pdb:main out[{Class:"gay"}] run data modify storage pdb:main in.Class set value "gay"

function pdb:save_me