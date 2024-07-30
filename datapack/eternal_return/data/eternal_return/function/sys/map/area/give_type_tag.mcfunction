## 현재 위치한 구역의 타입 정보별 태그 부여
# 안전구역
$execute if data storage player_data players[{id:$(id),location:{type:0}}] run tag @s add in_safe_zone
$execute unless data storage player_data players[{id:$(id),location:{type:0}}] run tag @s remove in_safe_zone
# 금지 예정 구역
$execute if data storage player_data players[{id:$(id),location:{type:1}}] run tag @s add in_scheduled_restricted_zone
$execute unless data storage player_data players[{id:$(id),location:{type:1}}] run tag @s remove in_scheduled_restricted_zone
# 금지구역
$execute if data storage player_data players[{id:$(id),location:{type:2}}] run tag @s add in_restricted_zone
$execute unless data storage player_data players[{id:$(id),location:{type:2}}] run tag @s remove in_restricted_zone
# 전장 예정 구역
$execute if data storage player_data players[{id:$(id),location:{type:3}}] run tag @s add in_scheduled_battle_zone
$execute unless data storage player_data players[{id:$(id),location:{type:3}}] run tag @s remove in_scheduled_battle_zone
# 전장 구역
$execute if data storage player_data players[{id:$(id),location:{type:4}}] run tag @s add in_battle_zone
$execute unless data storage player_data players[{id:$(id),location:{type:4}}] run tag @s remove in_battle_zone