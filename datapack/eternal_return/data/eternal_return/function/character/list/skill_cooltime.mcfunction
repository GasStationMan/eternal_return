execute as @a at @s if items entity @s player.cursor minecraft:carrot_on_a_stick run item replace entity @s player.cursor with air
execute as @a[nbt=!{Inventory:[{Slot:4b}]}] run item replace entity @s container.4 with minecraft:carrot_on_a_stick
execute as @a[nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick",Slot:4b}]}] run clear @s minecraft:carrot_on_a_stick
execute as @a[nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick"}]}] run clear @s minecraft:carrot_on_a_stick
execute as @a at @s run kill @e[distance=..2,limit=1,nbt={Item:{id:"minecraft:carrot_on_a_stick"}}]