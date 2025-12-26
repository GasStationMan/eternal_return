## 플레이어 아이디 임시 저장
execute store result storage player_data temp[0].id int 1 run scoreboard players get @s player_id
#tellraw @a [{"nbt":"temp[0].id","storage":"player_data"}]