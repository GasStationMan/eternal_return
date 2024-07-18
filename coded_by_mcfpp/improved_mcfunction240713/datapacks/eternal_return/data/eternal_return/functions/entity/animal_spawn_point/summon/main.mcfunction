$data modify storage minecraft:temp temp set value {animal : $(animal)}
execute at @s run function eternal_return:entity/animal_spawn_point/summon/summon/0
