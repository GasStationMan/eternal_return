## 스코어 자동 동기화

## 플레이어 수 & 팀 수
execute store result score #player_count NUM if entity @e[tag=player]


# 게임 시작 전
execute unless entity @a[tag=player,tag=game_start] run scoreboard players operation #wait.player ct1 = #player_count NUM
# 게임 시작 후
execute if entity @a[tag=player,tag=game_start] run scoreboard players operation #game.player ct1 = #player_count NUM
execute if entity @a[tag=player,tag=game_start] run scoreboard players operation #game.team ct1 = #player_count NUM

# 일차별 부활 표시
execute \
    if score #timer.day NUM matches 1 \
        run scoreboard players set #game.respawn ct1 0
execute \
    if score #timer.day NUM matches 2 \
    if score #timer.halfday NUM matches 1 \
        run scoreboard players set #game.respawn ct1 1
execute \
    if score #timer.day NUM matches 2 \
    if score #timer.halfday NUM matches 2 \
       run scoreboard players set #game.respawn ct1 2
execute \
    if score #timer.day NUM matches 3.. run scoreboard players set #game.respawn ct1 2