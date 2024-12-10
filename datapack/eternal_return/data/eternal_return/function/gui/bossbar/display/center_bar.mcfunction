## 화면 가운데 표시되는 검은 바
# 입력 값 : @s pdb:main / target , icon , text, time
# 상위 함수 : 없음

#"text":"실험이 시작되었습니다. 레이더를 활성화합니다."
# 파라미터
    $data modify storage temp cb.target set value $(target)
    $data modify storage temp cb.icon set value $(icon)
    $data modify storage temp cb.text set value $(text)
    $scoreboard players set #cb.sec NUM $(time)


# 예외처리
    execute if score #cb.sec NUM matches ..0 run return run tellraw @s {"text":"양수를 입력하십시오","color":"red"}

# 보여줄 플레이어

# 표기 시간

# 아이콘 (!)
# 텍스트


# free
data remove storage temp cb
scoreboard players reset #cb.sec NUM