## 구역별 타입 바꾸기
# 상위 함수 : function eternal_return:map/place
# 입력 값 : @s data.place / @s data.change
# 입력된 타입에 따라 map 스토리지의 구역이름 색 변경하기

## 타입별 변경
    # 일반구역
        $execute if data entity @s data{change:"safe"} run return run data modify storage map list.$(place).color set value "white"
    # 금지구역
        $execute if data entity @s data{change:"restricted"} run return run data modify storage map list.$(place).color set value "red"
    # 금지 예정구역
        $execute if data entity @s data{change:"scheduled_restrict"} run return run data modify storage map list.$(place).color set value "yellow"