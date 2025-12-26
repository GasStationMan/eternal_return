## 타이머
# 틱
execute if score #timer.tick NUM matches 1.. run scoreboard players remove #timer.tick NUM 1
# 초
execute if score #timer.tick NUM matches 0 if score #timer.sec NUM matches 0.. run scoreboard players remove #timer.sec NUM 1

## 초기화
# 반나절
execute if score #timer.halfday NUM matches 3 run function eternal_return:sys/game/timer/day
# 분
execute if score #timer.min NUM matches 0 if score #timer.sec NUM matches -1 run function eternal_return:sys/game/timer/halfday
# 초
execute if score #timer.min NUM matches 1.. if score #timer.sec NUM matches -1 run function eternal_return:sys/game/timer/min
# 틱
execute if score #timer.tick NUM matches 0 run scoreboard players add #timer.tick NUM 20