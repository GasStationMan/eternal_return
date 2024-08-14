execute on target run tag @s add targeted
execute store result score #motion_x ER.sys run data get entity @s Motion[0] 10000000
execute store result score #motion_y ER.sys run data get entity @s Motion[2] 10000000
scoreboard players set #motionExist ER.sys 1
execute if score #motion_x ER.sys matches 0 if score #motion_y ER.sys matches 0 run scoreboard players set #motionExist ER.sys 0
scoreboard players operation #cooltime ER.sys = @s ER.cooltime
execute at @s as @e[type=minecraft:item_display,tag=ER.animal.model,scores={ER.animal.this=1}] run function eternal_return:entity/animal/bear/behav/b1/code
execute on target run tag @s remove targeted
