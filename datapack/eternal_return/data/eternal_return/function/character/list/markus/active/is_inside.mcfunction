# get p
execute store result score #sk.p.x NUM at @s run data get entity @s Pos[0] 100
execute store result score #sk.p.y NUM at @s run data get entity @s Pos[2] 100

# Cross PAB
scoreboard players operation #pab NUM = #sk.b.x NUM
scoreboard players operation #pab NUM -= #sk.a.x NUM
scoreboard players operation #tmp2 NUM = #sk.p.y NUM
scoreboard players operation #tmp2 NUM -= #sk.a.y NUM
scoreboard players operation #pab NUM *= #tmp2 NUM

scoreboard players operation #tmp3 NUM = #sk.b.y NUM
scoreboard players operation #tmp3 NUM -= #sk.a.y NUM
scoreboard players operation #tmp4 NUM = #sk.p.x NUM
scoreboard players operation #tmp4 NUM -= #sk.a.x NUM
scoreboard players operation #tmp3 NUM *= #tmp4 NUM

scoreboard players operation #pab NUM -= #tmp3 NUM


# Cross PBC
scoreboard players operation #pbc NUM = #sk.c.x NUM
scoreboard players operation #pbc NUM -= #sk.b.x NUM
scoreboard players operation #tmp2 NUM = #sk.p.y NUM
scoreboard players operation #tmp2 NUM -= #sk.b.y NUM
scoreboard players operation #pbc NUM *= #tmp2 NUM

scoreboard players operation #tmp3 NUM = #sk.c.y NUM
scoreboard players operation #tmp3 NUM -= #sk.b.y NUM
scoreboard players operation #tmp4 NUM = #sk.p.x NUM
scoreboard players operation #tmp4 NUM -= #sk.b.x NUM
scoreboard players operation #tmp3 NUM *= #tmp4 NUM

scoreboard players operation #pbc NUM -= #tmp3 NUM

# Cross PCA
scoreboard players operation #pca NUM = #sk.a.x NUM
scoreboard players operation #pca NUM -= #sk.c.x NUM
scoreboard players operation #tmp2 NUM = #sk.p.y NUM
scoreboard players operation #tmp2 NUM -= #sk.c.y NUM
scoreboard players operation #pca NUM *= #tmp2 NUM

scoreboard players operation #tmp3 NUM = #sk.a.y NUM
scoreboard players operation #tmp3 NUM -= #sk.c.y NUM
scoreboard players operation #tmp4 NUM = #sk.p.x NUM
scoreboard players operation #tmp4 NUM -= #sk.c.x NUM
scoreboard players operation #tmp3 NUM *= #tmp4 NUM

scoreboard players operation #pca NUM -= #tmp3 NUM


# detect
execute if score #pab NUM matches ..-1 if score #pbc NUM matches ..-1 if score #pca NUM matches ..-1 run tag @s add markus_hit
execute if score #pab NUM matches ..-1 if score #pbc NUM matches ..-1 if score #pca NUM matches ..-1 run tag @s add markus_t1