scoreboard players set #getDamage ER.sys 0
execute store result score #HPTMP ER.sys run data get entity @s Health
execute if score #HPTMP ER.sys matches ..999 run function eternal_return:entity/hitbox/b1/b1/code
execute if score @s ER.health matches ..0 on passengers run return run function eternal_return:entity/hitbox/b1/b2/code
