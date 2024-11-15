
# 정렬 스코어보드에 데이터 입력
execute as @e[tag=zplace,tag=!dones] run scoreboard players operation @s sorting = @s NUM
# 가장 큰 값의 스코어로 모두 변경
scoreboard players operation @e[tag=zplace,tag=!dones] sorting < @e[tag=zplace,tag=!dones] sorting
# 가장 큰 스코어를 가진 개체에게 태그 부여
execute as @e[tag=zplace,tag=!dones] if score @s sorting = @s NUM run tag @s add lowscore
# 가장 큰 개체의 태그를 스토리지에 저장
execute as @e[tag=zplace,tag=lowscore,tag=!dones] run data modify storage score low append from entity @s data.place
# 정렬 스코어보드 지우기
scoreboard players reset @s sorting
# 마지막 태그 추가
tag @e[tag=zplace,tag=lowscore,tag=!dones] add dones
# 끝날 때까지 반복
execute if entity @e[tag=!lowscore,tag=zplace] run function eternal_return:map/area/sort_low