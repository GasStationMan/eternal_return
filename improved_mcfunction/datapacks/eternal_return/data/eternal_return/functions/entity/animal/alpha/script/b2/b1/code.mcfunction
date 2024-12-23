execute if score #this.HP ER.sys < #this.MaxHP ER.sys run function eternal_return:entity/animal/alpha/script/b2/b1/b1/code
execute at @s if entity @p[distance=0..6] if score #this.HP ER.sys = #this.MaxHP ER.sys as @e[type=minecraft:item_display,tag=ER.animal.model ,tag=this,tag=!aj.animal_alpha.animation.ready.playing] run function animated_java:animal_alpha/animations/ready/play
