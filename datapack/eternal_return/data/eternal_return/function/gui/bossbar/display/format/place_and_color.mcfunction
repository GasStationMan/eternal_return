## 위치 이름과 구역 상태에 따른 색 한 json으로 합치기
# 입력 값 : temp place.name / temp place.color
# 출력 값 : temp format_text
# 상위 함수 : function eternal_return:gui/bossbar/display/interface

# 이름과 색깔 합치기
    $data modify storage ui_temp temp.place set value '{"text":"$(name)","color":"$(color)"}'

# free
    data remove storage temp place