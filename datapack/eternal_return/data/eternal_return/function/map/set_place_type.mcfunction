## 구역 타입 설정
# 상위 함수 : function eternal_return:map/place
# 입력 값 : type(문자열)
# 출력 값 없음
# 금지예정구역/금지구역/일반구역 랜덤으로 세 곳을 지정한 타입으로 바꾸는 함수

# 타입 받아오기
    $data modify storage temp type.type set value "$(type)"
    # 잘못된 타입을 입력받은 경우
        execute unless data storage temp type{type:"safe"} unless data storage temp type{type:"restricted"} unless data storage temp type{type:"scheduled_restrict"} run \
            return run tellraw @s {"text":"잘못된 타입을 입력하였습니다","color":"red"}


# 무작위로 세 곳 위치 선택
    tag @e[tag=zplace,tag=!selected,limit=3,sort=random] add selected

## 구역 설정
    # nbt태그에 바꿀 타입 입력
        $execute as @e[tag=zplace,tag=selected] run data modify entity @s data.change set value "$(type)"
    # 스토리지 변경
        execute as @e[type=marker,tag=zplace,tag=selected] run function eternal_return:map/change_area_type with entity @s data
    # 태그 제거 후 변경
        tag @e[type=marker,tag=zplace,tag=selected] remove safe_area
        tag @e[type=marker,tag=zplace,tag=selected] remove restricted
        tag @e[type=marker,tag=zplace,tag=selected] remove scheduled_restrict
        $tag @e[type=marker,tag=zplace,tag=selected] add $(type)
        tag @e[type=marker,tag=zplace,tag=selected] remove selected

    # free
    execute as @e[type=marker,tag=zplace,tag=selected] run data remove entity @s data.change
    data remove storage temp type