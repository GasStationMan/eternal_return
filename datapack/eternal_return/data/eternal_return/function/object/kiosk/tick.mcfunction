## 키오스크 함수
# 상위 함수 :function eternal_return:object/tick
# 입출력 없음

## 플레이어 감지
    # 플레이어가 우클릭 했을 때
        execute if data entity @s[tag=!in_use] interaction on target run tag @s add use_kiosk
        execute if data entity @s[tag=!in_use] interaction run tag @s add in_use

    # 주위에 플레이어가 존재하지 않을 때
        execute at @s unless entity @p[tag=use_kiosk,distance=..2] run data remove entity @s interaction
        execute unless data entity @s interaction run tag @s remove in_use



#인터렉션은 한명이 누르고 다른 한 명이 우클릭 했을 때 interaction태그에 후에 우클릭한 사람의 uuid가 등록이 되는가 \
 아니면 한번 uuid가 등록되고 나면 고정되는가? => 플레이어가 누를 때마다 갱신된다.
