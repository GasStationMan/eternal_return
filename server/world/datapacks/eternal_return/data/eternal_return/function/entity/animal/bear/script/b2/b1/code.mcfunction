execute if score #this.HP ER.sys < #this.MaxHP ER.sys run function eternal_return:entity/animal/bear/script/b2/b1/b1/code
execute at @s if entity @p[distance=0..6] if score #this.HP ER.sys = #this.MaxHP ER.sys as @e[type=minecraft:item_display,tag=ER.animal.model ,scores={ER.animal.this=1},tag=!aj.animal_bear.animation.ready.playing] run function animated_java:animal_bear/animations/ready/play
