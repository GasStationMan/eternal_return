scoreboard players set #onVehicle ER.sys 0
execute on vehicle run scoreboard players set #onVehicle ER.sys 1
execute if score #onVehicle ER.sys matches 0 if entity @s[tag=rightclick,tag=!rest,nbt={SelectedItem:{id:"minecraft:red_bed",count:1}}] run function eternal_return:system/rest/rest/rest/0
execute if entity @s[tag=rest] run function eternal_return:system/rest/rest/rest/1
