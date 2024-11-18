## 두 자리수 숫자 변경
# 입력 값 : temp input_num
# 출력 값 : temp format_num
# 상위 함수 : function eternal_return:gui/bossbar/display/get_number

# 숫자가 9 이하인 경우
$execute if score #input.number NUM matches ..9 run data modify storage temp format_num set value "0$(input_num)"

# 숫자가 10 이상인 경우
$execute if score #input.number NUM matches 10.. run data modify storage temp format_num set value "$(input_num)"

# 인자 초기화
scoreboard players reset #input.num NUM