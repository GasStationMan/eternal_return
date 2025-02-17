execute as @s rotated ~20 0 positioned ^ ^ ^8 run summon marker ~ ~ ~ {Tags:["sk.point","sk.p1"]}
execute at @s rotated ~-20 0 positioned ^ ^ ^8 run summon marker ~ ~ ~ {Tags:["sk.point","sk.p2"]}
# get a,b,c
execute store result score #sk.a.x NUM run data get entity @s Pos[0] 100
execute store result score #sk.a.y NUM run data get entity @s Pos[2] 100
execute store result score #sk.b.x NUM run data get entity @e[tag=sk.p1,limit=1] Pos[0] 100
execute store result score #sk.b.y NUM run data get entity @e[tag=sk.p1,limit=1] Pos[2] 100
execute store result score #sk.c.x NUM run data get entity @e[tag=sk.p2,limit=1] Pos[0] 100
execute store result score #sk.c.y NUM run data get entity @e[tag=sk.p2,limit=1] Pos[2] 100
kill @e[tag=sk.point]
