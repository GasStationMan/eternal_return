execute store result score #HPTMP ER.sys run data get entity @s Health
execute if score #HPTMP ER.sys matches ..999 run function eternal_return:entity/hitbox/hitbox/hitbox/0
execute if score @s ER.health matches ..0 on passengers run return run function eternal_return:entity/hitbox/hitbox/hitbox/1
execute if score @s ER.health matches 1.. if score #getDamage ER.sys matches 1.. run function eternal_return:entity/hitbox/hitbox/hitbox/2
