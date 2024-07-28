## 브리핑 룸 게임 대기 바

# 배경 움직임
execute if score #wait.bg.tick CT1 matches 1.. run scoreboard players add #wait.bg.tick CT1 1
execute if score #wait.bg.tick CT1 matches 4.. run scoreboard players add #wait.bg CT1 1
execute if score #wait.bg CT1 matches 9.. run scoreboard players set #wait.bg CT1 1
execute if score #wait.bg.tick CT1 matches 4.. run scoreboard players set #wait.bg.tick CT1 1

# 남은 시간
execute if score #wait.remaining.tick CT1 matches 1.. run scoreboard players add #wait.remaining.tick CT1 1
execute if score #wait.remaining.tick CT1 matches 21.. if score #wait.remaining CT1 matches 1.. run scoreboard players remove #wait.remaining CT1 1
execute if score #wait.remaining.tick CT1 matches 21.. run scoreboard players set #wait.remaining.tick CT1 1