## 캐릭터 정보 제거
# 상위 함수 : function eternal_return:character/get_character or none
# 입력 값 : @s pdb:main in
# 개인 스토리지에 캐릭터 데이터를 제거하는 함수


function pdb:get_me
# 캐릭터 태그 제거
    function eternal_return:character/clear_character_data/tag with storage pdb:main in.character

# 플레이어 dp에서 캐릭터 데이터 제거
    data remove storage pdb:main in.character

function pdb:save_me