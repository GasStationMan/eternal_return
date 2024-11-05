## 캐릭터 배열에서 프레임 번호에 맞는 정보 가져오기
    $data modify storage pdb:main in.character_array_frame[0] set from storage pdb:main in.character_array[$(index0)]
    $data modify storage pdb:main in.character_array_frame[1] set from storage pdb:main in.character_array[$(index1)]
    $data modify storage pdb:main in.character_array_frame[2] set from storage pdb:main in.character_array[$(index2)]