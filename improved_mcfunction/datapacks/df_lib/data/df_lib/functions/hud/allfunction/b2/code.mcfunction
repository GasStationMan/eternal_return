execute store result storage minecraft:temp temp.id int 1 run scoreboard players get @s player_id
function df_lib:hud/allfunction/b2/b2/code with storage minecraft:temp temp
$tag @s remove $(tag)
data remove storage minecraft:temp temp
