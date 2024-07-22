$execute if entity @s[tag= aj.animal_$(animal).animation.attack,scores={aj.anim_time = 2}] on vehicle run function eternal_return:entity/animal/class/behav/b2/b6/b3/code
$execute if entity @s[tag=!aj.animal_$(animal).animation.attack] run return run function eternal_return:entity/animal/class/behav/b2/b6/b4/code with storage minecraft:temp temp
