scoreboard players set #onVehicle ER.sys 0
execute on vehicle run scoreboard players set #onVehicle ER.sys 1
execute if score #onVehicle ER.sys matches 0 if entity @s[tag=rightclick,tag=!rest] if data entity @s {SelectedItem:{id:"minecraft:red_bed",count:1}} run function eternal_return:system/rest/b1/b1/code
execute if entity @s[tag=rest] run function eternal_return:system/rest/b1/b2/code
