execute as @a[tag=hyunwooskill] run scoreboard players add @s hyunwooskill 1
execute as @a[tag=hyunwooskill,scores={hyunwooskill=1}] at @s run tp @s ^ ^ ^ ~ 0

function eternal_return:sys/character/hyunwoo/summon

function eternal_return:sys/character/hyunwoo/looking

execute as @a[tag=hyunwooskill,scores={hyunwooskill=1..12}] at @s if block ^ ^ ^1 air run tp @s ^ ^ ^0.5
execute as @a[tag=hyunwooskill,scores={hyunwooskill=1..12}] at @s if block ^ ^ ^1 short_grass run tp @s ^ ^ ^0.5
execute as @a[tag=hyunwooskill] at @s run particle dust{color:[0.702,0.322,0.106],scale:1} ~ ~1 ~ 0.5 0.5 0.5 0 20 force