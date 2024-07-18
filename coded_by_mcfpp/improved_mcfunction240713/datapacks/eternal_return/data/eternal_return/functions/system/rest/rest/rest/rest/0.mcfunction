tellraw @s {"text":"휴식이 해제되었습니다.","color":"red"}
scoreboard players operation #playerID ER.sys = @s player_id
execute as @e[type=minecraft:interaction] if score @s player_id = #playerID ER.sys run kill @s
effect clear @s regeneration
tag @s remove rightclick
tag @s remove rest
