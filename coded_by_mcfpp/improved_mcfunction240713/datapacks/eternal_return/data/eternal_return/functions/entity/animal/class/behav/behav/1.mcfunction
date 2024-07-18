execute if score #cooltime ER.sys matches 1.. on vehicle run function eternal_return:entity/animal/class/behav/behav/behav/1
$execute if entity @s[tag= aj.animal_$(animal).animation.ready] positioned as @s facing entity @p[tag=targeted] feet run function eternal_return:entity/animal/class/behav/behav/behav/2
execute if score #cooltime ER.sys matches 81.. run return run function eternal_return:entity/animal/class/behav/behav/behav/3 with storage minecraft:temp temp
execute if score #cooltime ER.sys matches 80 run return run function eternal_return:entity/animal/class/behav/behav/behav/4 with storage minecraft:temp temp
execute if score #cooltime ER.sys matches 1 on vehicle run return run function eternal_return:entity/animal/class/behav/behav/behav/5 with storage minecraft:temp temp
execute if score #cooltime ER.sys matches 0 run return run function eternal_return:entity/animal/class/behav/behav/behav/6 with storage minecraft:temp temp
