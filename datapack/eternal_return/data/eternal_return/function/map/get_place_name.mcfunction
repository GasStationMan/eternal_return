## 구역별 지명을 개인 스토리지에 저장
# 상위 함수 : function eternal_return:map/tick
# 입력값 : pdb:main in.place

# init에 저장된 구역별 한글 이름 가져오기
    $execute if entity @s[tag=$(place)] run data modify storage pdb:main in.place_name set from storage init map_name.$(place)