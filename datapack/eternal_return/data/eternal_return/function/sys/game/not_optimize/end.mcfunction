kill @e[tag=gametime]
execute unless entity @e[tag=gametime] run bossbar remove boss:timer
execute unless entity @e[tag=gametime] run kill @e[tag=r1]
execute unless entity @e[tag=gametime] run effect clear @a
execute unless entity @e[tag=gametime] run scoreboard players set daycycle daycycle 0
execute unless entity @e[tag=gametime] run kill @e[tag=lastarea1]
execute unless entity @e[tag=gametime] run setblock -518 83 592 air
execute unless entity @e[tag=gametime] run setblock -572 85 471 air
execute unless entity @e[tag=gametime] run setblock -781 83 468 air
execute unless entity @e[tag=gametime] run setblock -511 83 504 air
execute unless entity @e[tag=gametime] run setblock -717 84 428 air
execute unless entity @e[tag=gametime] run kill @e[tag=hoteltree]
execute unless entity @e[tag=gametime] run kill @e[tag=cemeterytree]
execute unless entity @e[tag=gametime] run kill @e[tag=templetree]
execute unless entity @e[tag=gametime] run kill @e[tag=foresttree]
execute unless entity @e[tag=gametime] run kill @e[tag=streamtree]
execute unless entity @e[tag=gametime] at @e[tag=st1] if block ~ ~ ~ sculk run setblock ~ ~ ~ air
execute unless entity @e[tag=gametime] run kill @e[tag=st1]
execute unless entity @e[tag=gametime] run kill @e[tag=stone]
scoreboard players set @a[tag=player] time 0
scoreboard players set @a[tag=player] second 0
tag @a remove credit
scoreboard players reset @a credittime
scoreboard players reset @a credit
xp set @a 0 points
xp set @a 0 levels