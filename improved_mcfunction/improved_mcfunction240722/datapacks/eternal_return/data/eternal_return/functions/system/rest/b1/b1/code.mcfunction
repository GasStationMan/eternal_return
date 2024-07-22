tellraw @s {"text":"휴식 중입니다.","color":"yellow"}
summon minecraft:interaction ~ ~ ~ {Tags:["rest","this"]}
ride @s mount @e[type=minecraft:interaction,tag=this,limit=1]
scoreboard players operation @e[type=minecraft:interaction,tag=this] player_id = @s player_id
tag @e[type=minecraft:interaction,tag=this] remove this
tag @s remove rightclick
tag @s add rest
scoreboard players set #onVehicle ER.sys 1
