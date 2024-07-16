execute on target run tag @s add targeted
execute store result score #motion_x ER.sys run data get entity @s Motion[0] 10000000
execute store result score #motion_y ER.sys run data get entity @s Motion[2] 10000000
function eternal_return:entity/animal/class/behav/behav/0
scoreboard players operation #cooltime ER.sys = @s ER.cooltime
execute at @s as @e[type=minecraft:item_display,tag=this,tag=ER.animal.model] run function eternal_return:entity/animal/class/behav/behav/1 with storage minecraft:temp temp
execute on target run tag @s remove targeted
