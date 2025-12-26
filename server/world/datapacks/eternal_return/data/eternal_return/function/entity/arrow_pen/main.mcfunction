scoreboard players set #bool ER.sys 0
execute if entity @s[nbt={inBlockState:{Name:"minecraft:barrier"}}] run function eternal_return:entity/arrow_pen/b1/code
execute if score #bool ER.sys matches 0 run function eternal_return:entity/arrow_pen/b2/code
execute if score #bool ER.sys matches 1 run function eternal_return:entity/arrow_pen/b3/code
