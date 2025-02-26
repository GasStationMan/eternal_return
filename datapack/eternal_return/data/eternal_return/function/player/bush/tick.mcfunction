## 큰 잔디에 들어갈 때
execute if block ~ ~ ~ dead_bush run tag @s add hide_in_bush
execute if block ~ ~ ~ dead_bush run team join bush @s

## 큰 잔디에서 나올 때
execute if block ~ ~ ~ air run tag @s[tag=hide_in_bush] remove hide_in_bush
execute if block ~ ~ ~ air run team leave @s

# 잔디 안에 있을 때
execute if entity @s[tag=hide_in_bush] run function eternal_return:player/armors/clear
execute if entity @s[tag=hide_in_bush] run effect give @s invisibility 1 1 true

# 잔디 밖에 있을 때
execute unless entity @s[tag=hide_in_bush] run effect clear @s invisibility
execute unless entity @s[tag=hide_in_bush] if items entity @s armor.head #diamond_armor run function eternal_return:player/armors/blood/head
execute unless entity @s[tag=hide_in_bush] if items entity @s armor.chest #diamond_armor run function eternal_return:player/armors/blood/chest
execute unless entity @s[tag=hide_in_bush] if items entity @s armor.legs #diamond_armor run function eternal_return:player/armors/blood/legs
execute unless entity @s[tag=hide_in_bush] if items entity @s armor.feet #diamond_armor run function eternal_return:player/armors/blood/feet
execute unless entity @s[tag=hide_in_bush] if items entity @s armor.head #iron_armor run function eternal_return:player/armors/iron/head
execute unless entity @s[tag=hide_in_bush] if items entity @s armor.chest #iron_armor run function eternal_return:player/armors/iron/chest
execute unless entity @s[tag=hide_in_bush] if items entity @s armor.legs #iron_armor run function eternal_return:player/armors/iron/legs
execute unless entity @s[tag=hide_in_bush] if items entity @s armor.feet #iron_armor run function eternal_return:player/armors/iron/feet
