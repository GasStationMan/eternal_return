## 문자열 받아오기
# 입력 값 : temp place.name / temp place.color
# 출력 값 : temp format_num
# 상위 함수 없음

# 스코어 입력받기
    execute store result storage temp input_num int 1 run scoreboard players get #input.number NUM
# 타입 입력받기
    $data modify storage temp input.type set value "$(type)"

# 문자열 합치기
    # 두 자릿수인 경우
        execute if data storage temp input{type:"two"} run function eternal_return:gui/bossbar/display/format/text with storage temp

# free
data remove storage temp input
data remove storage temp input_num