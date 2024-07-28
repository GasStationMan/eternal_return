## 게임에서 나갔을 때
# 보스바 재표시
execute if score @s[tag=ingame_ui] quit matches 1.. run function eternal_return:sys/bossbar/set/remove with storage player_data temp[0]
execute if score @s[tag=ingame_ui] quit matches 1.. run function eternal_return:sys/bossbar/set/add with storage player_data temp[0]
execute if score @s[tag=ingame_ui] quit matches 1.. run function eternal_return:sys/bossbar/set/show with storage player_data temp[0]
# 스코어 초기화
execute if score @s quit matches 1.. run scoreboard players set @s quit 0