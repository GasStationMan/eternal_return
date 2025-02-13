## 캐릭터를 선택한 후
# 상위 함수 : function eternal_return:gui/screen/display
# 사용되는 시점 : 캐릭터를 선택한 후 이동
# 필요 스코어보드 : page.num == 3
# 화면 전환 방식 : fade
# 캐릭터 선택 후 브리핑 룸 이동 및 스크린 종료 


## 화면
    # 보스바
        $execute if score @s Page.ct matches 20 run bossbar set line1.$(UUID0) name ""
        $execute if score @s Page.ct matches 20 run bossbar set line2.$(UUID0) name ""
        $execute if score @s Page.ct matches 20 run bossbar set line3.$(UUID0) name ""
        $execute if score @s Page.ct matches 20 run bossbar set line4.$(UUID0) name ""
        $execute if score @s Page.ct matches 20 run bossbar set line5.$(UUID0) name ""
        $execute if score @s Page.ct matches 20 run bossbar set line6.$(UUID0) name ""

# 플레이어 스토리지 free
    function pdb:get_me
    
    data remove storage pdb:main in.character_array
    data remove storage pdb:main in.character_array_frame
    data remove storage pdb:main in.point

    function pdb:save_me

## 부가 기능
    # 캐릭터 부여
        execute if score @s Page.ct matches 20 run function eternal_return:character/get_character
    # 브리핑 룸으로 이동
        spreadplayers -293 448 3 30 under 63 false @s[tag=frist_join]
    # 태그
        execute if score @s Page.ct matches 1 run tag @s add waiting
        execute if score @s Page.ct matches 1 run function eternal_return:send_msg {target:"@s",text:'{"text":"본 서버는 공정한 게임의 가치를 중요하게 생각합니다."}',color:"gold",timer:0}
        execute if score @s Page.ct matches 1 run function eternal_return:send_msg {target:"@s",text:'{"text":"부당한 티밍은 제재 대상이 될 수 있습니다."}',color:"gold",timer:0}
        tag @s remove frist_join
    # 사이드 바 생성
        execute if score @s Page.ct matches 1 run function eternal_return:gui/sidebar/new with storage pdb:main args
    # 갑옷 슬롯 제거
        execute if score @s Page.ct matches 20 run clear @s paper
    # 게임모드 변경
        execute if score @s Page.ct matches 1 run gamemode adventure @s
    # 화면 종료
        execute if score @s Page.ct matches 1 run tag @s add screen_off