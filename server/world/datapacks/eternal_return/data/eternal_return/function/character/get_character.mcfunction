## 캐릭터 정보 가져오기
# 상위 함수 : function eternal_return:gui/screen/display/selected
# 입력 값 : @s Page.slot
# 캐릭터 데이터를 개인 스토리지에 저장하는 함수


function pdb:get_me
# 이전 데이터가 있다면 선제거
    execute if data storage pdb:main in.character run function eternal_return:character/clear_character_data

# 캐릭터 데이터 가져오기
    # 플레이어가 랜덤을 선택한 경우
        execute if score @s Page.slot matches 1 store result storage temp char_no int 1 run random value 2..31
    # 플레이어가 특정 캐릭터를 선택한 경우
        execute if score @s Page.slot matches 2.. store result storage temp char_no int 1 run scoreboard players get @s Page.slot

    # 개인 스토리지에 불러오기 및 저장
        function eternal_return:character/get_character/name with storage temp

    # free
        data remove storage temp char_no
        
function pdb:save_me