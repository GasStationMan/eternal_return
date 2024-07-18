data modify storage minecraft:temp temp set value {animal : "bear", OPTdistance : 20, damage : 5, attackTick : 8, attackDistance : 5}
scoreboard players operation #this.ID ER.sys = @s df_id
function eternal_return:entity/animal/bear/script/script/0 with storage minecraft:temp temp
scoreboard players operation #this.HP ER.sys = @e[type=minecraft:ghast       ,tag=this,tag=ER.animal.hitbox] ER.health
scoreboard players operation #this.MaxHP ER.sys = @e[type=minecraft:zombie      ,tag=this,tag=ER.animal.root  ] ER.health
execute as @s run function eternal_return:entity/animal/bear/script/script/1
function eternal_return:entity/animal/class/optimize/main with storage minecraft:temp temp
execute if score #this.HP ER.sys matches 1.. if score #this.AI ER.sys matches 0 run function eternal_return:entity/animal/class/ready/main with storage minecraft:temp temp
execute if score #this.HP ER.sys matches 1.. if score #this.AI ER.sys matches 1 run function eternal_return:entity/animal/class/behav/main with storage minecraft:temp temp
execute if score #this.HP ER.sys matches ..0 run function eternal_return:entity/animal/class/death/main with storage minecraft:temp temp
execute at @s run tp @e[type=minecraft:ghast       ,tag=this,tag=ER.animal.hitbox] ~ ~ ~
data remove storage minecraft:temp temp
scoreboard players set #this.AI ER.sys 0
scoreboard players set #MotionExist ER.sys 0
tag @e[tag=this] remove this
