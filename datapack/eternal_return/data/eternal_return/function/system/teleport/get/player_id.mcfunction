$execute store result score @s player_id run data get storage player_data players[{warp:{place:$(place),done:0}}].id
$execute store result entity @s data.id int 1 run data get storage player_data players[{warp:{place:$(place),done:0}}].id
tag @s add fix_player_id
execute if entity @s[tag=fix_player_id] run function eternal_return:system/teleport/set/fix_player_id with entity @s data