## 캐릭터 배열에서 번호에 맞는 이름 가져오기
# 상위 함수 : function eternal_return:character/get_character
# 입력 값 : temp char_no
# 출력 값 : pdb:main players[].character.name / tag [character.name]


# 번호에 맞는 이름 가져오기
    $data modify storage pdb:main in.character set from storage config character_list[{no:$(char_no)}]
# 태그 설정하기
    function eternal_return:character/get_character/tag with storage pdb:main in.character