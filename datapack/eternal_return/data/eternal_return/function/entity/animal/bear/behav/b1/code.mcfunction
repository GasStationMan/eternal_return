execute if entity @s[tag= aj.animal_bear.animation.ready.playing] run function animated_java:animal_bear/animations/ready/stop
execute if score #cooltime ER.sys matches 1.. run return run function eternal_return:entity/animal/bear/behav/b1/b1/code
execute if score #cooltime ER.sys matches 0 run function eternal_return:entity/animal/bear/behav/b1/b2/code
