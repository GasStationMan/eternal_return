## 서버 메시지 띄우기
# 상위 함수 : 없음
# 입력 값 : target(문자열), text(문자열), color(문자열), timer(bool)
# 출력 : 채팅에 메시지 출력
# 설명 : 입력 받은 값을 채팅창에 시스템 전용 스타일의 문자열을 출력

## 파라미터
    $scoreboard players set #usetimer CT1 $(timer)
    $data modify storage text msg set value $(text)

## 오류 메시지
    execute unless score #usetimer CT1 matches 0..1 run return run tellraw @s [{"text":"잘못된 값이 입력되었습니다.","color":"red"}]

# 타이머를 사용하지 않는 경우
    $execute if score #usetimer CT1 matches 0 run tellraw $(target) {"nbt":"msg","storage":"text","interpret":true,"color":"$(color)"}
    execute if score #usetimer CT1 matches 0 run return 1

# 타이머를 사용하는 경우
    $execute \
        if score #usetimer CT1 matches 1 if score #gametime.min NUM matches ..9 if score #gametime.sec NUM matches ..9 \
            run tellraw $(target) [\
                {"text":"[0","color":"$(color)","font":"godo"},{"score":{"name":"#gametime.min","objective":"CT1"}}," : 0",{"score":{"name":"#gametime.sec","objective":"CT1"}},"] ",\
                {"nbt":"msg","storage":"text","interpret":true}\
            ]
    $execute \
        if score #usetimer CT1 matches 1 if score #gametime.min NUM matches ..9 if score #gametime.sec NUM matches 10.. \
            run tellraw $(target) [\
                {"text":"[0","color":"$(color)","font":"godo"},{"score":{"name":"#gametime.min","objective":"CT1"}}," : ",{"score":{"name":"#gametime.sec","objective":"CT1"}},"] ",\
                {"nbt":"msg","storage":"text","interpret":true}\
            ]
    $execute \
        if score #usetimer CT1 matches 1 if score #gametime.min NUM matches 10.. if score #gametime.sec NUM matches ..9 \
            run tellraw $(target) [\
                {"text":"[","color":"$(color)","font":"godo"},{"score":{"name":"#gametime.min","objective":"CT1"}}," : 0",{"score":{"name":"#gametime.sec","objective":"CT1"}},"] ",\
                {"nbt":"msg","storage":"text","interpret":true}\
            ]
    $execute \
        if score #usetimer CT1 matches 1 if score #gametime.min NUM matches 10.. if score #gametime.sec NUM matches 10.. \
            run tellraw $(target) [\
                {"text":"[","color":"$(color)","font":"godo"},{"score":{"name":"#gametime.min","objective":"CT1"}}," : ",{"score":{"name":"#gametime.sec","objective":"CT1"}},"] ",\
                {"nbt":"msg","storage":"text","interpret":true}\
            ]


# 입력값 초기화
scoreboard players reset #usetimer CT1
data remove storage text msg