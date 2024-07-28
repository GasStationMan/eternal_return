## 스코어보드 생성
# 아이디
scoreboard objectives remove player_id
scoreboard objectives add player_id dummy

# 페이지 
scoreboard objectives add Page.num dummy
scoreboard objectives add Page.slot dummy
scoreboard objectives add Page.ct dummy
scoreboard objectives add clickStick minecraft.used:minecraft.warped_fungus_on_a_stick



## 스토리지 생성
data remove storage minecraft:player_data players
data modify storage player_data players set value []
data modify storage player_data temp set value [{id:0},{armor:0},{index:""},{},{text:''},{credit:0},{place:""}]

## 플레이어 스코어 및 태그 지우기
tag @a remove player_id
scoreboard players reset @a player_id

## 플레이어 아이디 카운트 초기화
scoreboard players set #player_id_count player_id 0