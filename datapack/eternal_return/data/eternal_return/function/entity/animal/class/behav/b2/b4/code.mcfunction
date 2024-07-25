say skill started
execute on vehicle run effect give @s minecraft:slowness infinite 10
$execute if entity @s[tag= aj.animal_$(animal).animation.move.playing] run function animated_java:animal_$(animal)/animations/move/stop
