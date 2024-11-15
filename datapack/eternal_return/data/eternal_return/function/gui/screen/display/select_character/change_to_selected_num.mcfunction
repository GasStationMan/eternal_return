## 캐릭터를 선택했을 때 배열 숫자 변경
# 입출력 없음
# 상위 함수 : function eternal_return:gui/screen/display/select_character
# 현재 선택한 슬롯 값이 가진 배열의 위치(좌표)를 저장하는 함수
# 가로 좌표 : (현재 슬롯 - 1) % 5
# 세로 좌표 : (현재 슬롯 - 1) / 5 

function pdb:get_me

    # 정수 입력
    scoreboard players set #5 NUM 5
    scoreboard players set #500 NUM 500

    # 미선택으로 배열 초기화
        data modify storage pdb:main in.character_array set value [[999,998,997,996,995],[994,993,992,991,990],[989,988,987,986,985],[984,983,982,981,980],[979,978,977,976,975],[974,973,972,971,970],[969,0,0,0,0]]
    
    ## 선택된 캐릭터의 배열 인데스 가져오기

        # 숫자 입력 받기
            scoreboard players operation #input.width NUM = @s Page.slot
            scoreboard players operation #input.length NUM = @s Page.slot
        # 가로 n-1 % 5
            scoreboard players operation #input.width NUM -= #1 NUM
            scoreboard players operation #input.width NUM %= #5 NUM
        # 세로 n-1 / 5
            scoreboard players operation #input.length NUM -= #1 NUM
            scoreboard players operation #input.length NUM /= #5 NUM
        # retrun
            execute store result storage pdb:main in.point.width int 1 run scoreboard players get #input.width NUM
            execute store result storage pdb:main in.point.length int 1 run scoreboard players get #input.length NUM

    # 선택됨으로 바꾸기
        function eternal_return:gui/screen/display/select_character/change_array_data with storage pdb:main in.point

    # free
        scoreboard players reset #5 NUM
        scoreboard players reset #500 NUM
        scoreboard players reset #input.temp NUM
        scoreboard players reset #input.width NUM
        scoreboard players reset #input.length NUM

function pdb:save_me