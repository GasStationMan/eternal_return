execute if score #this.HP ER.sys < #this.MaxHP ER.sys run function eternal_return:entity/animal/class/ready/b1/code
$execute at @s if entity @p[distance=0..6] if score #this.HP ER.sys = #this.MaxHP ER.sys as @e[tag=!aj.animal_$(animal).animation.ready,tag=ER.animal.model,tag=this] run function animated_java:animal_$(animal)/animations/ready/play
