scoreboard players set #HP_manage_block ER.sys 0
execute if score #getDamage ER.sys matches 1.. run return run scoreboard players set #HP_manage_block ER.sys 1
execute if score @s ER.sys matches 0 run return run function eternal_return:entity/hitbox/b1/b3/b1/code
