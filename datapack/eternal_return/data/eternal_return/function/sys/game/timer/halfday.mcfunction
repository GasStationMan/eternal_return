## 일차별 시간 설정

# 3일차 이전
execute if score #timer.day NUM matches ..3 run scoreboard players set #timer.sec NUM 59
# 4일차
execute if score #timer.day NUM matches 4 if score #timer.halfday NUM matches 1 run scoreboard players set #timer.sec NUM 59
execute if score #timer.day NUM matches 4 if score #timer.halfday NUM matches 2 run scoreboard players set #timer.sec NUM 29
# 5일차 이후
execute if score #timer.day NUM matches 5.. run scoreboard players set #timer.sec NUM 29

# 반나절 더하기
scoreboard players add #timer.halfday NUM 1