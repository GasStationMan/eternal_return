## 타입 별 자리수 변경
# 입력 값 : #input.number NUM / type : (two/three/space)
# 출력 값 : temp format_num
# 상위 함수 : function eternal_return:gui/bossbar/display/interface

# 스코어 입력받기
    execute store result storage temp input_num int 1 run scoreboard players get #input.number NUM
    execute store result storage temp input_num2 int 1 run scoreboard players get #input.number2 NUM
# 타입 입력받기
    $data modify storage temp input.type set value "$(type)"

# 숫자 변환
    # 두 자릿수인 경우
        execute if data storage temp input{type:"two"} run function eternal_return:gui/bossbar/display/format/two_digit with storage temp
    # 세 자릿수인 경우
        execute if data storage temp input{type:"three"} run function eternal_return:gui/bossbar/display/format/three_digit with storage temp
    # 크래딧 전용
        execute if data storage temp input{type:"credit"} run function eternal_return:gui/bossbar/display/format/credit_digit with storage temp
    # 둘째 자릿수를 띄워쓰기로 변경
        execute if data storage temp input{type:"space"} run function eternal_return:gui/bossbar/display/format/space with storage temp
    # 둘째 자릿수를 띄워쓰기로 변경
        execute if data storage temp input{type:"space2"} run function eternal_return:gui/bossbar/display/format/space2 with storage temp
    # 레벨
        execute if data storage temp input{type:"level"} run function eternal_return:gui/bossbar/display/format/level with storage temp
    # 공격력
        execute if data storage temp input{type:"atk"} run function eternal_return:gui/bossbar/display/format/atk with storage temp
    # 공격 속도
        execute if data storage temp input{type:"atk_spd"} run function eternal_return:gui/bossbar/display/format/atk_spd with storage temp
    # 방어력
        execute if data storage temp input{type:"armor"} run function eternal_return:gui/bossbar/display/format/armor with storage temp
    # 방어강도
        execute if data storage temp input{type:"armor_tou"} run function eternal_return:gui/bossbar/display/format/armor_tou with storage temp
    # 액티브 쿨타임
        execute if data storage temp input{type:"active_cool"} run function eternal_return:gui/bossbar/display/format/active_cool with storage temp
    # 패시브 쿨타임
        execute if data storage temp input{type:"passive_cool"} run function eternal_return:gui/bossbar/display/format/passive_cool with storage temp
# free
data remove storage temp input
data remove storage temp input_num
data remove storage temp input_num2