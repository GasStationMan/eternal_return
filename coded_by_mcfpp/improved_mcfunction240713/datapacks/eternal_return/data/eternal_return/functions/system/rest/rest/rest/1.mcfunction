effect give @s regeneration infinite 1 true
execute if score #onVehicle ER.sys matches 0 run function eternal_return:system/rest/rest/rest/rest/0
execute if entity @s[tag=rightclick,nbt={SelectedItem:{id:"minecraft:red_bed",count:1}}] run function eternal_return:system/rest/rest/rest/rest/1
scoreboard players reset @a[scores={restd=1..}] restd
scoreboard players reset @a[scores={resthit=1..}] resthit
scoreboard players reset @a[scores={restj=1..}] restj
