# 인덱스 스코어 할당
$scoreboard players set #$(id).loading.index CT1 1
## 로딩바 개인 스토리지로 받아오기
$execute if entity @s[tag=loading1.5] run data modify storage player_data players[{id:$(id)}].loading set from storage text data[0]
$execute if entity @s[tag=loading3] run data modify storage player_data players[{id:$(id)}].loading set from storage text data[1]
$execute if entity @s[tag=loading7] run data modify storage player_data players[{id:$(id)}].loading append from storage text data[2]
$execute if entity @s[tag=loading7] run data modify storage player_data players[{id:$(id)}].loading append from storage text data[2]

# text 개인 스토리지에 저장
$data modify storage minecraft:player_data players[{id:$(id)}].text set from storage minecraft:player_data temp[4].text
# text temp 비우기
data modify storage minecraft:player_data temp[4].text set value ''