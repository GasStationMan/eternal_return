scoreboard players operation #ID ER.sys = @s df_id
execute as @e[type=minecraft:zombie,tag=ER.animal.root] run function eternal_return:entity/hitbox/b1/b4/b3/code
scoreboard players operation #HPkey ER.sys = @s ER.health
scoreboard players set #temp ER.sys 100
scoreboard players operation #HPkey ER.sys *= #temp ER.sys
scoreboard players operation #HPkey ER.sys /= #RootHP ER.sys
scoreboard players set #HRWP20 ER.sys 2000
scoreboard players operation #HRWP20 ER.sys /= #RootHP ER.sys
scoreboard players set #HRWP2 ER.sys 200
scoreboard players operation #HRWP2 ER.sys /= #RootHP ER.sys
execute store result storage minecraft:temp temp.HP int 1 run scoreboard players get @s ER.health
execute on passengers run function eternal_return:entity/hitbox/b1/b4/b4/code with storage minecraft:temp temp
