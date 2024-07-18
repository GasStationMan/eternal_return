scoreboard players operation #HPSPL ER.sys = #i ER.sys
scoreboard players operation #HPSPL ER.sys %= #HRWP20 ER.sys
scoreboard players operation #HPSPS ER.sys = #i ER.sys
scoreboard players operation #HPSPS ER.sys %= #HRWP2 ER.sys
execute if score #HPSPS ER.sys matches 0 run function eternal_return:entity/hitbox/hitbox/hitbox/hitbox/hitbox/hitbox/hitbox/0 with storage minecraft:temp temp
execute if score #HPSPL ER.sys matches 0 run function eternal_return:entity/hitbox/hitbox/hitbox/hitbox/hitbox/hitbox/hitbox/1 with storage minecraft:temp temp
execute unless score #HPSPS ER.sys matches 0 run function eternal_return:entity/hitbox/hitbox/hitbox/hitbox/hitbox/hitbox/hitbox/2 with storage minecraft:temp temp
