scoreboard players set #bool ER.sys 0
execute if score #getDamage ER.sys matches 1.. run return run function eternal_return:entity/hitbox/b1/b3/b1/code
execute if score @s ER.sys matches 0 run return run function eternal_return:entity/hitbox/b1/b3/b2/code
