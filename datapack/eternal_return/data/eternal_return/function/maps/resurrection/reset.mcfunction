
execute store result storage minecraft:temp temp.id int 1 run scoreboard players get @s player_id
function eternal_return:maps/hyper_loop/reset_branch with storage minecraft:temp temp
tag @s remove choosing_resurrection
data remove storage minecraft:temp temp