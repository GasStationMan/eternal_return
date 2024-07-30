## 밤낮 바꾸기
# 스코어보드 및 시간 변경
execute if entity @a[tag=change_daycycle] run scoreboard players set #game.daycycle.tick CT1 1
execute if score #game.daycycle.tick CT1 matches 1.. run scoreboard players add #game.daycycle.tick CT1 1
# 이팩트 부여
execute if score #game.daycycle.tick CT1 matches 2 run effect give @a darkness 2 10 true
execute if score #game.daycycle.tick CT1 matches 2 run effect give @a blindness 2 10 true
# 시간 변경
execute if score #game.daycycle.tick CT1 matches 2 if score #timer.halfday CT1 matches 2 run time set day
execute if score #game.daycycle.tick CT1 matches 2 if score #timer.halfday CT1 matches 1 run time set midnight
# 스코어 리셋
execute if score #game.daycycle.tick CT1 matches 11 run scoreboard players reset #game.daycycle.tick CT1
# 태그 제거
tag @a[tag=change_daycycle] remove change_daycycle
