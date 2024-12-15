## 새로운 플레이어 DB 추가
function pdb:new_player
function pdb:get_me

 # 플레이어 초기 데이터
    # 아이템 제거
        clear @s
    # 태그 부여
        tag @s add frist_join
        tag @s add player
        tag @s add screen
    
    # 태그 삭제
        tag @s remove on_camera_overlay
        tag @s remove waiting
        tag @s remove in_game

    # 스코어보드 설정
        # 페이지
            scoreboard players set @s Page.frame 0
            scoreboard players set @s Page.slot 1
            scoreboard players set @s Page.ct 0
            scoreboard players set @s Page.num 0
        # 슬롯 저장
            execute store result score #temp.now.scroll.num NUM run data get entity @s SelectedItemSlot
        # 크래딧 설정
            scoreboard players set @s credit 0
        # kill
            scoreboard players set @s kill 0
        # death
            scoreboard players set @s death 0

    # 보스바 생성 및 표기
        function eternal_return:gui/bossbar/new with storage pdb:main args
        function eternal_return:gui/bossbar/show with storage pdb:main args

function pdb:save_me