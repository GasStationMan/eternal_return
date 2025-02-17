scoreboard players add @s markus_skill 1
execute if score @s markus_skill matches 1 run playsound minecraft:item.mace.smash_ground_heavy player @a ~ ~ ~ 1 0.7
execute if score @s markus_skill matches 1 run particle block{block_state:"minecraft:stone"} ~ ~ ~ 1.5 0 1.5 1 100 normal
execute if score @s markus_skill matches 1 run function eternal_return:character/list/markus/active/detect