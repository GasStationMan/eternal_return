execute if entity @s[tag=kiosk] run function df_lib:hud/allfunction/b1/code
execute if entity @s[tag=!kiosk, tag=choosing_kiosk] run function df_lib:hud/allfunction/b2/code {tag : choosing_kiosk}
