## 숫자를 문자열로 변환하기
    $scoreboard players set #input.int NUM $(int)
    $execute if score #input.int NUM matches ..9 run data modify storage temp show_charlist[0] prepend value "00$(int)"
    $execute if score #input.int NUM matches 10..99 run data modify storage temp show_charlist[0] prepend value "0$(int)"
    $execute if score #input.int NUM matches 100..999 run data modify storage temp show_charlist[0] prepend value "$(int)"
    
    scoreboard players reset #input.int NUM








data modify storage pdb:main in.character_array_frame[0][0]






    data modify storage temp intTotext set from 