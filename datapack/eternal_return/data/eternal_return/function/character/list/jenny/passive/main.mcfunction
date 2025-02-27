execute if entity @s[scores={jenny_passive_skill=1..}] run tag @s add jenny_passive_skill

#execute if entity @s[tag=!jenny_passive_skill,tag=!passive_cool] unless data entity @s {Inventory:[{id:"minecraft:totem_of_undying"}]} run item replace entity @p weapon.offhand with totem_of_undying[lore=['{"color":"dark_red","italic":true,"text":"절대 다른 곳으로 옮기지 마시오"}']] 1
execute if entity @s[tag=jenny_passive_skill] at @s run function eternal_return:character/list/jenny/passive/skill


## 불사의 토템 위치 고정
execute if entity @s[tag=!jenny_passive_skill,tag=!passive_cool] at @s if items entity @s player.cursor minecraft:totem_of_undying run item replace entity @s player.cursor with air
execute if entity @s[tag=!jenny_passive_skill,tag=!passive_cool] unless data entity @s {Inventory:[{Slot:-106b}]} run clear @s minecraft:totem_of_undying
execute if entity @s[tag=!jenny_passive_skill,tag=!passive_cool] unless data entity @s {Inventory:[{Slot:-106b}]} run item replace entity @s weapon.offhand with minecraft:totem_of_undying[lore=['{"color":"dark_red","italic":true,"text":"절대 다른 곳으로 옮기지 마시오"}']] 1
execute if entity @s[tag=!jenny_passive_skill,tag=!passive_cool] unless data entity @s {Inventory:[{id:"minecraft:totem_of_undying",Slot:-106b}]} run clear @s minecraft:totem_of_undying
execute if entity @s[tag=!jenny_passive_skill,tag=!passive_cool] unless data entity @s {Inventory:[{id:"minecraft:totem_of_undying"}]} run clear @s minecraft:totem_of_undying
execute if entity @s[tag=!jenny_passive_skill,tag=!passive_cool] at @s run kill @e[distance=..2,limit=1,nbt={Item:{id:"minecraft:totem_of_undying"}}]