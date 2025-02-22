execute if entity @s[scores={jenny_passive_skill=1..}] run tag @s add jenny_passive_skill

execute if entity @s[tag=!jenny_passive_skill,tag=!passive_cool] unless data entity @s {Inventory:[{id:"minecraft:totem_of_undying"}]} run item replace entity @p weapon.offhand with totem_of_undying 1
execute if entity @s[tag=jenny_passive_skill] at @s run function eternal_return:character/list/jenny/passive/skill
