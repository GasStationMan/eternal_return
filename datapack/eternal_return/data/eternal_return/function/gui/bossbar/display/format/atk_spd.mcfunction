## 띄워쓰기 변환
# 입력 값 : temp input_num, temp input_num2
# 출력 값 : temp format_num
# 상위 함수 : function eternal_return:gui/bossbar/display/get_number


$data modify storage temp format_num set value [{"text":"$(input_num).$(input_num2)","font":"gui/character/text/atk_spd"}]

# 인자 초기화
scoreboard players reset #input.num NUM