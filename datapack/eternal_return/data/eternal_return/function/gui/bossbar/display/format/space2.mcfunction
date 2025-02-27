## 띄워쓰기 변환
# 입력 값 : temp input_num
# 출력 값 : temp format_num
# 상위 함수 : function eternal_return:gui/bossbar/display/get_number

# 숫자가 9 이하인 경우
$execute if score #input.number NUM matches ..9 run data modify storage temp format_num set value " $(input_num) "

# 숫자가 10..99인 경우
$execute if score #input.number NUM matches 10..99 run data modify storage temp format_num set value " $(input_num)"

# 숫자가 100 이상인 경우
$execute if score #input.number NUM matches 100.. run data modify storage temp format_num set value "$(input_num)"

# 인자 초기화
scoreboard players reset #input.num NUM