execute if entity @s[tag= !choosing_kiosk] at @s run tp @s ~ ~ ~ 0 0
execute if entity @s[tag= !choosing_kiosk] run tag @s add choosing_kiosk
scoreboard players set #hud_main.mouse_pointer_limit_width ER.sys 800
scoreboard players set #hud_main.mouse_pointer_limit_height ER.sys 250
function df_lib:hud/allfunction/b1/b1/code
