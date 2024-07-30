### 게임 시작 전 브리핑 룸



## 캐릭터를 선택하기 전
execute as @a[tag=ingame_ui,tag=!wait_bar,tag=briefing_room,tag=!waitingPlayer] run function eternal_return:sys/map/briefing_room/waitingplayer/give_tag

execute if entity @a[tag=waitingPlayer] as @a[tag=waitingPlayer] run function eternal_return:sys/map/briefing_room/waitingplayer/feature



#> 보스바
# 남은 시간, 플레이어 수
execute if entity @a[tag=wait_bar] run function eternal_return:sys/bossbar/wait_bar
# 곧 시작
execute if entity @a[tag=now_bar] run function eternal_return:sys/bossbar/now_bar


## 스코어보드
# 게임 시작 전 플레이어 수가 줄어든 경우
execute if score #wait.player CT1 matches 2..9 run tag @a[tag=now_bar] remove now_bar

# 일정 인원 이하인 경우
execute if score #wait.remaining CT1 matches 7.. run function eternal_return:sys/bossbar/set/now_score
execute if entity @a[tag=!wait_bar] run function eternal_return:sys/bossbar/set/wait_score
execute if score #wait.player CT1 matches ..9 if score #wait.remaining.tick CT1 matches 10.. if entity @a[tag=wait_bar] run function eternal_return:sys/bossbar/set/wait_score

# 일정 인원 이상인 경우
execute if score #wait.player CT1 matches 17.. if score #wait.remaining CT1 matches 11.. run scoreboard players set #wait.remaining CT1 10
execute if score #wait.remaining CT1 matches 5 run scoreboard players set #now.trigger CT1 1
execute if score #wait.remaining CT1 matches 5 run tag @a add now_bar

# 게임 시작
execute if score #wait.remaining CT1 matches 1 if score #wait.remaining.tick CT1 matches 1 run title @a times 10t 2s 10t
execute if score #wait.remaining CT1 matches 1 if score #wait.remaining.tick CT1 matches 2 run title @a title {"text":"1","font":"screen_effect","color":"#4e5c24"}
execute if score #wait.remaining CT1 matches 1 if score #wait.remaining.tick CT1 matches 19 run tag @a add last_waiting
execute if score #wait.remaining CT1 matches 1 if score #wait.remaining.tick CT1 matches 19 run tag @a remove wait_bar
execute if score #wait.remaining CT1 matches 1 if score #wait.remaining.tick CT1 matches 19 run tag @a remove now_bar
# 텔포 추가, game_start 추가, 중앙 바 추가
