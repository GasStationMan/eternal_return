## 일차별 시간 설정

# 3일차 이전
execute if score #timer.day CT1 matches ..3 run scoreboard players set #timer.sec CT1 59
# 4일차
execute if score #timer.day CT1 matches 4 if score #timer.halfday CT1 matches 1 run scoreboard players set #timer.sec CT1 59
execute if score #timer.day CT1 matches 4 if score #timer.halfday CT1 matches 2 run scoreboard players set #timer.sec CT1 29
# 5일차 이후
execute if score #timer.day CT1 matches 5.. run scoreboard players set #timer.sec CT1 29

# 반나절 더하기
scoreboard players add #timer.halfday CT1 1