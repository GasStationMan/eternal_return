execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="골목길"] run summon armor_stand -722.5 84 652.0 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}
execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="양궁장"] run summon armor_stand -609.5 87 700 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}
execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="모래사장"] run summon armor_stand -436.5 82 575.0 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}
execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="묘지"] run summon armor_stand -578.5 84 452.0 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}
execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="성당"] run summon armor_stand -553.0 84 421.5 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}
execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="항구"] run summon armor_stand -458.5 84 382.0 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}
execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="공장"] run summon armor_stand -568.5 84 340.0 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}
execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="소방서"] run summon armor_stand -668.5 84 567.0 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}
execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="숲"] run summon armor_stand -535.5 84 509.0 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}
execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="주유소"] run summon armor_stand -706.0 84 689.5 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}
execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="병원"] run summon armor_stand -668.5 84 396.0 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}
execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="호텔"] run summon armor_stand -497.0 84 642.5 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}
execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="경찰서"] run summon armor_stand -721.5 84 569.0 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}
execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="연못"] run summon armor_stand -642.5 84 468.0 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}
execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="학교"] run summon armor_stand -573.5 84 635.0 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}
execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="개울"] run summon armor_stand -708.5 84 455.0 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}
execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="절"] run summon armor_stand -758.5 84 515.0 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}
execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="고급 주택가"] run summon armor_stand -429.5 84 478 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}
execute if entity @e[tag=gametime,scores={gametime=10201}] if entity @e[tag=lastarea,name="창고"] run summon armor_stand -449.0 84 424.5 {NoGravity:1b,Silent:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["lastarea1"]}

execute as @e[tag=lastarea1] at @s run tag @a[distance=..7,tag=!lastarea1,tag=player] add lastarea2
execute as @e[tag=lastarea1] at @s run tp @s ~ ~ ~ ~10 0
execute as @e[tag=lastarea1] at @s run particle end_rod ^ ^-1.7 ^7 0.1 0 0.1 0.03 10 force

execute as @e[tag=lastarea1] at @s run tag @a[distance=7.0001..,tag=!lastarea1,tag=player] remove lastarea2
execute as @a[tag=lastarea2] unless entity @e[tag=lastarea1] run tag @s remove lastarea2
