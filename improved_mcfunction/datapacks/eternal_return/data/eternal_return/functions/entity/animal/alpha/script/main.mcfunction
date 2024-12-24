execute store result storage minecraft:temp temp.id int 1 run scoreboard players get @s df_id
tag @s add this
execute on passengers run tag @s add this
scoreboard players operation #this.id ER.sys = @s df_id
execute as @e[type=minecraft:ghast, tag=ER.animal.hitbox] if score @s df_id = #this.id ER.sys run function eternal_return:entity/animal/alpha/script/b1/code
scoreboard players operation #this.HP ER.sys = @e[type=minecraft:ghast       ,tag=ER.animal.hitbox, tag=this, limit=1] ER.health
scoreboard players operation #this.MaxHP ER.sys = @s ER.health
scoreboard players set #this.AI ER.sys 1
execute if data entity @s {NoAI:1b} run scoreboard players set #this.AI ER.sys 0
execute if score #this.HP ER.sys matches 1.. run function eternal_return:entity/animal/alpha/script/b2/code
execute if score #this.HP ER.sys matches ..0 run function eternal_return:entity/animal/alpha/script/b3/code
data modify entity @e[type=minecraft:ghast       ,tag=ER.animal.hitbox, tag=this, limit=1] Pos set from entity @s Pos
tag @e[tag=ER.animal, tag=this] remove this
