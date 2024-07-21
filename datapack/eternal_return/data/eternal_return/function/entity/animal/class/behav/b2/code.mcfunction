execute if score #cooltime ER.sys matches 1.. on vehicle run function eternal_return:entity/animal/class/behav/b2/b2/code
$execute if entity @s[tag= aj.animal_$(animal).animation.ready] run function animated_java:animal_$(animal)/animations/ready/stop
execute if score #cooltime ER.sys matches 61.. run return run function eternal_return:entity/animal/class/behav/b2/b3/code with storage minecraft:temp temp
execute if score #cooltime ER.sys matches 60 run return run function eternal_return:entity/animal/class/behav/b2/b4/code with storage minecraft:temp temp
execute if score #cooltime ER.sys matches 1 on vehicle run return run function eternal_return:entity/animal/class/behav/b2/b5/code with storage minecraft:temp temp
execute if score #cooltime ER.sys matches 0 run return run function eternal_return:entity/animal/class/behav/b2/b6/code with storage minecraft:temp temp
