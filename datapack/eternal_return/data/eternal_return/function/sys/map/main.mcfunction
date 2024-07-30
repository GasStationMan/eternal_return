##> 맵

## 플레이어 
execute as @a[tag=player] at @s run function eternal_return:sys/map/player

## 구역 설정
# 구역별 상태 반영
function eternal_return:sys/map/area/tick
# 구역별 맵 플레이어 수 저장
execute as @e[tag=zplace] run function eternal_return:sys/map/count_player

## 브리핑 룸
function eternal_return:sys/map/briefing_room/tick