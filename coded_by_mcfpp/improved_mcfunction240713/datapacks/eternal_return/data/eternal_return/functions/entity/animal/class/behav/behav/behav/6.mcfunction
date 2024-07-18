$execute if entity @s[tag= aj.animal_$(animal).animation.attack,scores={aj.anim_time = 2}] on vehicle run function eternal_return:entity/animal/class/behav/behav/behav/behav/5
$execute if entity @s[tag=!aj.animal_$(animal).animation.attack] run return run function eternal_return:entity/animal/class/behav/behav/behav/behav/6 with storage minecraft:temp temp
