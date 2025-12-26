$summon interaction ~ ~ ~ {width:$(width),height:-$(height),Tags:["new_hitbox","df_lib_hitbox",$(tag)]}
$scoreboard players set #tempWidth float $(width)
scoreboard players operation #tempWidth float *= #10000 float
scoreboard players operation #tempWidth float /= #2 float
$scoreboard players set #tempHeight float $(height)
scoreboard players operation #tempHeight float *= #10000 float
scoreboard players operation #tempHeight float /= #2 float
execute as @e[type=minecraft:interaction,tag=new_hitbox,limit=1] run function df_lib:float4/vec3d/new_hitbox/b1/code
scoreboard players reset #tempWidth float
scoreboard players reset #tempHeight float
