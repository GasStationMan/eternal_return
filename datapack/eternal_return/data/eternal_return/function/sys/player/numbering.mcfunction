
## 카운트 +1
scoreboard players add #player_id_count player_id 1
## 플레이어 아이디 부여
scoreboard players operation @s player_id = #player_id_count player_id

## 플레이어 기초 데이터
function eternal_return:temp/input/id
function eternal_return:sys/player/input_data with storage player_data temp[0]
function eternal_return:sys/bossbar/set/add with storage player_data temp[0]
function eternal_return:temp/free/id


## 태그 부여
tag @s add ingame_ui
tag @s add player_id