execute on target run tag @s add targeted
scoreboard players set #motionExist ER.sys 1
execute if data entity @s {Motion:[0.0d,0.0d,0.0d]} run scoreboard players set #motionExist ER.sys 0
scoreboard players operation #cooltime ER.sys = @s ER.cooltime
execute at @s on passengers run function eternal_return:entity/animal/boar/behav/b1/code
execute on target run tag @s remove targeted
