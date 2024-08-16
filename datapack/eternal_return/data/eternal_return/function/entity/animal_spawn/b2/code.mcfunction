scoreboard players operation #tmp ER.sys = @s[type=minecraft:marker] ER.cooltime
scoreboard players set #temp ER.sys 20
scoreboard players operation #tmp ER.sys /= #temp ER.sys
execute store result storage minecraft:temp temp.cooltime int 1 run scoreboard players get #tmp ER.sys
execute on vehicle run function eternal_return:entity/animal_spawn/b2/b3/code with storage minecraft:temp temp
scoreboard players remove @s[type=minecraft:marker] ER.cooltime 1
