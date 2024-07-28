summon marker ^ ^ ^0 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^1 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^2 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^3 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^4 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^5 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^6 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^7 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^8 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^9 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^10 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^11 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^12 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^13 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^14 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^15 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^16 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^17 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^18 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^19 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^20 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^21 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^22 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^23 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
summon marker ^ ^ ^24 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happyaimshot"]}
execute as @e[tag=happyaimshot] at @s run tp @s ~ ~1.5 ~
playsound minecraft:custom.happy_shot master @a ~ ~ ~ 2 1 0
playsound minecraft:custom.happy_bang2 master @a ~ ~ ~ 0.7 1 0
#playsound minecraft:item.mace.smash_ground_heavy master @a ~ ~ ~ 1 1.5 0
#playsound minecraft:entity.warden.attack_impact master @a ~ ~ ~ 1 1 0

scoreboard players remove @s happybullet 1
scoreboard players remove @s[tag=!happyfocus_decrease] happyfocus 4
scoreboard players remove @s[tag=happyfocus_decrease] happyfocus 2
scoreboard players add @s happyaimc 1