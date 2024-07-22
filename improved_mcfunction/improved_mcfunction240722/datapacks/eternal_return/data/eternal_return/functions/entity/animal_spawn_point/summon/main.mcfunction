$data modify storage minecraft:temp temp set value {animal : $(animal)}
execute at @s summon minecraft:marker run function eternal_return:entity/animal_spawn_point/summon/b1/code with storage minecraft:temp temp
