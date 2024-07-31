# temp id 저장
function eternal_return:temp/input/id
function eternal_return:temp/input/place with storage player_data temp[0]
execute store result storage player_data temp[6].id int 1 run scoreboard players get @s player_id


# 플레이어가 구역 입퇴장 시 태그 설정
function eternal_return:sys/map/set_tag

## 스토리지
# 지역별 스토리지 정보 저장
function eternal_return:sys/map/save_place with storage player_data temp[0]

# map_data에서 가져온 맵 상태별로 색 지정 후 반환
function eternal_return:sys/map/get_area_type with storage player_data temp[6]
# 구역의 상태에 따라 태그 부여
function eternal_return:sys/map/area/give_type_tag with storage player_data temp[0]






# temp free
function eternal_return:temp/free/id
function eternal_return:temp/free/place
data remove storage player_data temp[6].id