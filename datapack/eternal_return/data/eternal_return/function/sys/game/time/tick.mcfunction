##> 게임 시간 타이머

## 스코어보드

# 증가
execute if score #gametime.tick CT1 matches 1.. run scoreboard players add #gametime.tick CT1 1
execute if score #gametime.tick CT1 matches 21 run scoreboard players add #gametime.sec CT1 1
execute if score #gametime.sec CT1 matches 60 if score #gametime.min CT1 matches ..98 run scoreboard players add #gametime.min CT1 1

# 초기화
execute if score #gametime.sec CT1 matches 60 run scoreboard players set #gametime.sec CT1 0
execute if score #gametime.tick CT1 matches 21 run scoreboard players set #gametime.tick CT1 1