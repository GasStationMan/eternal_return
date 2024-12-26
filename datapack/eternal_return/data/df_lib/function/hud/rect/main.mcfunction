$scoreboard players set #x ER.sys $(x)
$scoreboard players set #y ER.sys $(y)
$scoreboard players set #dx ER.sys $(dx)
$scoreboard players set #dy ER.sys $(dy)
$scoreboard players set #posX1 ER.sys $(x)
$scoreboard players set #posY1 ER.sys $(y)
scoreboard players operation #posX2 ER.sys = #x ER.sys
scoreboard players operation #posX2 ER.sys -= #dx ER.sys
scoreboard players operation #posY2 ER.sys = #y ER.sys
scoreboard players operation #posX3 ER.sys = #x ER.sys
scoreboard players operation #posX3 ER.sys -= #dx ER.sys
scoreboard players operation #posY3 ER.sys = #y ER.sys
scoreboard players operation #posY3 ER.sys += #dy ER.sys
scoreboard players operation #posX4 ER.sys = #x ER.sys
scoreboard players operation #posY4 ER.sys = #y ER.sys
scoreboard players operation #posY4 ER.sys += #dy ER.sys
data modify storage minecraft:temp pos.laser_length set value 700
execute store result storage minecraft:temp pos.dot1_X int 1 run scoreboard players get #posX1 ER.sys
execute store result storage minecraft:temp pos.dot1_Y int 1 run scoreboard players get #posY1 ER.sys
execute store result storage minecraft:temp pos.dot2_X int 1 run scoreboard players get #posX2 ER.sys
execute store result storage minecraft:temp pos.dot2_Y int 1 run scoreboard players get #posY2 ER.sys
function df_lib:hud/dot_in_poly with storage minecraft:temp pos
execute store result storage minecraft:temp pos.dot1_X int 1 run scoreboard players get #posX2 ER.sys
execute store result storage minecraft:temp pos.dot1_Y int 1 run scoreboard players get #posY2 ER.sys
execute store result storage minecraft:temp pos.dot2_X int 1 run scoreboard players get #posX3 ER.sys
execute store result storage minecraft:temp pos.dot2_Y int 1 run scoreboard players get #posY3 ER.sys
function df_lib:hud/dot_in_poly with storage minecraft:temp pos
execute store result storage minecraft:temp pos.dot1_X int 1 run scoreboard players get #posX3 ER.sys
execute store result storage minecraft:temp pos.dot1_Y int 1 run scoreboard players get #posY3 ER.sys
execute store result storage minecraft:temp pos.dot2_X int 1 run scoreboard players get #posX4 ER.sys
execute store result storage minecraft:temp pos.dot2_Y int 1 run scoreboard players get #posY4 ER.sys
function df_lib:hud/dot_in_poly with storage minecraft:temp pos
execute store result storage minecraft:temp pos.dot1_X int 1 run scoreboard players get #posX4 ER.sys
execute store result storage minecraft:temp pos.dot1_Y int 1 run scoreboard players get #posY4 ER.sys
execute store result storage minecraft:temp pos.dot2_X int 1 run scoreboard players get #posX1 ER.sys
execute store result storage minecraft:temp pos.dot2_Y int 1 run scoreboard players get #posY1 ER.sys
function df_lib:hud/dot_in_poly with storage minecraft:temp pos
execute if score #cnt ER.sys matches 0 run return 0
scoreboard players set #temp ER.sys 2
scoreboard players operation cnt ER.sys = #cnt ER.sys
scoreboard players operation #cnt ER.sys %= #temp ER.sys
execute if score #cnt ER.sys matches 1 run return 1
