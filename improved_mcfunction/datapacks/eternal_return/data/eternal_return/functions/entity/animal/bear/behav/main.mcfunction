execute on target run tag @s add targeted
execute store result score #x ER.sys run data get entity @s Motion[0] 1000000
execute store result score #y ER.sys run data get entity @s Motion[1] 1000000
execute store result score #z ER.sys run data get entity @s Motion[2] 1000000
scoreboard players set #motionExist ER.sys 1
execute if score #x ER.sys matches 0 if score #y ER.sys matches 0 if score #z ER.sys matches 0 run scoreboard players set #motionExist ER.sys 0
scoreboard players operation #cooltime ER.sys = @s ER.cooltime
execute positioned as @s on passengers run function eternal_return:entity/animal/bear/behav/b1/code
execute on target run tag @s remove targeted
