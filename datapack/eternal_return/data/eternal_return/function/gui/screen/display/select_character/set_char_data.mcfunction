## 캐릭터 배열과 프레임 배열 추가하기
function pdb:get_me
    data modify storage pdb:main in.character_array set from storage config character_array
    data modify storage pdb:main in.character_array_frame set value [[],[],[]]
function pdb:save_me