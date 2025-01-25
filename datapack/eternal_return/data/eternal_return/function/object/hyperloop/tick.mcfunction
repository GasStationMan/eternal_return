## 하이퍼루프
# 상위 함수 :function eternal_return:object/tick
# 입출력 없음

## 플레이어 감지
    # 플레이어가 우클릭 했을 때
        execute if data entity @s[tag=!in_use] interaction on target run tag @s add use_hyperloop
        execute if data entity @s[tag=!in_use] interaction run tag @s add in_use

    # 주위에 플레이어가 존재하지 않을 때
        execute at @s unless entity @p[tag=use_hyperloop,distance=..2] run data remove entity @s interaction
        execute unless data entity @s interaction run tag @s remove in_use