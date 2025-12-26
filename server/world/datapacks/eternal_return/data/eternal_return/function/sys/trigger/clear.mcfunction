## 개인 스토리지 로딩 텍스트 제거
$data remove storage player_data players[{id:$(id)}].loading
# 액션바 비우기
title @s actionbar ""
# 개인 스토리지 비우기
$data remove storage minecraft:player_data players[{id:$(id)}].text
# 스코어 제거
$scoreboard players reset #$(id).loading ct1
# 태그 제거
tag @s remove pause_loading
tag @s remove charge2
tag @s remove loading1.5
tag @s remove loading3
tag @s remove loading7
tag @s remove show_loading
tag @s remove clear_loading
tag @s remove loading