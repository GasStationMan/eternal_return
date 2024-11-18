## 타입 별 자리수 변경
# 입력 값 : #input.number NUM / type : (two/three/space)
# 출력 값 : temp format_num
# 상위 함수 : function eternal_return:gui/bossbar/display/interface

# 스코어 입력받기
    execute store result storage temp input_num int 1 run scoreboard players get #input.number NUM
# 타입 입력받기
    $data modify storage temp input.type set value "$(type)"

# 숫자 변환
    # 두 자릿수인 경우
        execute if data storage temp input{type:"two"} run function eternal_return:gui/bossbar/display/format/two_digit with storage temp
    # 세 자릿수인 경우
        execute if data storage temp input{type:"three"} run function eternal_return:gui/bossbar/display/format/three_digit with storage temp
    # 둘째 자릿수를 띄워쓰기로 변경
        execute if data storage temp input{type:"space"} run function eternal_return:gui/bossbar/display/format/space with storage temp

# free
data remove storage temp input
data remove storage temp input_num