tag @s add this
tag @s add ER
tag @s add ER.spawn
tag @s add ER.spawn.animal
$tag @s add ER.spawn.animal.$(animal)
data modify entity @s data set value {animal:[]}
scoreboard players set @s ER.sys 0
scoreboard players set @s ER.cooltime 0
tp @s ~ ~3 ~
execute summon minecraft:text_display run function eternal_return:entity/animal_spawn_point/summon/b1/b1/code
