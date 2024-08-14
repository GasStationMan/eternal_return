execute if entity @s[tag= aj.animal_boar.animation.skill.playing] run return run function eternal_return:entity/animal/boar/behav/b1/b3/b3/code
function animated_java:animal_boar/animations/move/stop
function animated_java:animal_boar/animations/attack/stop
function animated_java:animal_boar/animations/skill/play
execute on vehicle run effect give @s minecraft:slowness infinite 10
