## 숫자를 문자열로 변환하기
    $scoreboard players set #input.int NUM $(int)
    $execute if score #input.int NUM matches 0..9 run data modify storage temp intTotext set value '{"text":"\\u600$(int)"}'
    $execute if score #input.int NUM matches 10..99 run data modify storage temp intTotext set value '{"text":"\\u60$(int)"}'
    $execute if score #input.int NUM matches 100..999 run data modify storage temp intTotext set value '{"text":"\\u6$(int)"}'
    
    scoreboard players reset #input.int NUM