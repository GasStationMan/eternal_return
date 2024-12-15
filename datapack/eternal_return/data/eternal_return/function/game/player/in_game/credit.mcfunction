## 플레이어 크래딧 지급
# 입출력 :없음
# 상위 함수 : function eternal_return:game/player/in_game

## 정해진 시간마다 크래딕 지급
    execute if score #credit.tick NUM < #credit.tick.value NUM run scoreboard players add #credit.tick NUM 1
    execute if score #credit.tick NUM = #credit.tick.value NUM run scoreboard players add @a[tag=in_game] credit 1
    execute if score #credit.tick NUM = #credit.tick.value NUM run scoreboard players set #credit.tick NUM 0