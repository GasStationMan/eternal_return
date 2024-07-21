$execute if entity @s[tag= aj.animal_$(animal).animation.attack, scores={aj.anim_time = $(attackTick)}] run return run damage @p[tag=targeted] $(damage) minecraft:player_attack
$execute if entity @s[tag=!aj.animal_$(animal).animation.attack] run return run function eternal_return:entity/animal/class/behav/b2/b3/b2/b1/code with storage minecraft:temp temp
