$execute if entity @s[tag= aj.animal_$(animal).animation.attack.playing,scores={aj.attack.frame = 2}] on vehicle run function eternal_return:entity/animal/class/behav/b2/b6/b3/code
$execute if entity @s[tag=!aj.animal_$(animal).animation.attack.playing] run return run function eternal_return:entity/animal/class/behav/b2/b6/b4/code with storage minecraft:temp temp
