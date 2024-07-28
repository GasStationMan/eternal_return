#
#   1. loading 태그를 부여한다
#   2. 로딩바의 초를 입력받는다
#   3. 입력받은 값마다 서로 다른 태그를 부여한다
#

#태그 부여
tag @s add loading
tag @s add get_text
tag @s add show_loading

# 초 입력 받기
$scoreboard players set #input.loading NUM $(sec)
# 시간별 태그 부여
execute if score #input.loading NUM matches 15 run tag @s add loading1.5
execute if score #input.loading NUM matches 30 run tag @s add loading3
execute if score #input.loading NUM matches 70 run tag @s add loading7

# 상단 표기 텍스트 스토리지 저장
$data modify storage minecraft:player_data temp[4].text set value $(text)

# 스코어 초기화
scoreboard players reset #input.loading NUM