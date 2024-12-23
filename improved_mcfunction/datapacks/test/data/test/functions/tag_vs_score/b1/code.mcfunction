scoreboard players set @e[type=minecraft:marker,sort=random,limit=1] sys 1
scoreboard players set @e[type=minecraft:marker,scores={sys=1}] sys 0
execute store result storage minecraft:loop while.i int 1 run scoreboard players add #i sys 1
execute if score #i sys matches ..31 run function test:tag_vs_score/b1/code with storage minecraft:loop while
