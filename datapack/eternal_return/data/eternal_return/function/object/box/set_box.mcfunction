## 상자 소환 함수
# 상위 함수 : function eternal_return:game/timeline
# 입력 : <count(갯수)> <type:(상자유형)>
        # type : food, epic, mythic
# 출력 : 선택되지 않은 박스 마커 중 입력한 갯수와 타입의 태그를 설정

$execute as @e[type=marker,tag=box_place,tag=!selected,limit=$(count),sort=random] run tag @s add $(type)_box
tag @e[type=marker,tag=food_box,tag=!selected] add selected
tag @e[type=marker,tag=epic_box,tag=!selected] add selected
tag @e[type=marker,tag=mythic_box,tag=!selected] add selected