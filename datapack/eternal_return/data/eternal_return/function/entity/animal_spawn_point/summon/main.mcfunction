$data modify storage minecraft:temp temp set value {animal : $(animal)}
execute at @s summon minecraft:marker run function eternal_return:entity/animal_spawn_point/summon/b1/code with storage minecraft:temp temp
execute rotated as @s as @e[type=minecraft:marker,tag=this] run tp @s ~ ~ ~ ~ 0
tag @s add this
$say $(animal) spawn point has been summoned!
tag @s remove this
