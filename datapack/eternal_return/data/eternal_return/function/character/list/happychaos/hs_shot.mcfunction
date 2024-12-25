summon marker ^ ^ ^0 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happynormalshot"]}
summon marker ^ ^ ^1 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happynormalshot"]}
summon marker ^ ^ ^2 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happynormalshot"]}
summon marker ^ ^ ^3 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happynormalshot"]}
summon marker ^ ^ ^4 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happynormalshot"]}
summon marker ^ ^ ^5 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happynormalshot"]}
summon marker ^ ^ ^6 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happynormalshot"]}
summon marker ^ ^ ^7 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happynormalshot"]}
summon marker ^ ^ ^8 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happynormalshot"]}
summon marker ^ ^ ^9 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happynormalshot"]}
summon marker ^ ^ ^10 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happynormalshot"]}
summon marker ^ ^ ^11 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happynormalshot"]}
summon marker ^ ^ ^12 {NoGravity:1b,Silent:1b,Invulnerable:1b,Tags:["happynormalshot"]}
execute as @e[tag=happynormalshot] at @s run tp @s ~ ~1.5 ~
playsound minecraft:custom.happy_shot master @a ~ ~ ~ 2 1 0
playsound minecraft:custom.happy_bang1 master @a ~ ~ ~ 0.7 1 0
#playsound minecraft:item.mace.smash_ground master @a ~ ~ ~ 1 1.5 0
#playsound minecraft:entity.warden.attack_impact master @a ~ ~ ~ 1 1.5 0
scoreboard players remove @s happybullet 1
scoreboard players remove @s[tag=!happyfocus_decrease] happyfocus 2
scoreboard players remove @s[tag=happyfocus_decrease] happyfocus 1