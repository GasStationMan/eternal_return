scoreboard players operation #player_id_temp player_id = @s player_id

execute as @a[tag=warp] if score @s player_id = #player_id_temp player_id run tag @s add this
tp @a[tag=this] ~ ~ ~

tag @a[tag=this] remove warp
tag @a[tag=this] remove this

kill @s

scoreboard players reset #player_id_temp player_id