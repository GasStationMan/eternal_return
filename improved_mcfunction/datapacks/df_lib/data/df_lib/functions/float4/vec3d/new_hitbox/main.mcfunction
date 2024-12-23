$summon interaction ~ ~ ~ {width:$(width),height:-$(height),Tags:["new_hitbox","df_lib_hitbox",$(tag)]}
execute store result score #tempWidth float run data get entity @e[tag=new_hitbox,limit=1] width 5000
execute store result score #tempHeight float run data get entity @e[tag=new_hitbox,limit=1] height -5000
execute as @e[type=minecraft:interaction,tag=new_hitbox,limit=1] run function df_lib:float4/vec3d/new_hitbox/b1/code
scoreboard players reset #tempWidth float
scoreboard players reset #tempHeight float
