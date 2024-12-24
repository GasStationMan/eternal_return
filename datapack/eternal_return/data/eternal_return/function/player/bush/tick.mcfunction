## 큰 잔디에 들어갈 때
execute if block ~ ~ ~ tall_grass run tag @s add hide_in_bush

## 큰 잔디에서 나올 때
execute if block ~ ~ ~ air run tag @s[tag=hide_in_bush] remove hide_in_bush

# 잔디 안에 있을 때
execute if entity @s[tag=hide_in_bush] run function eternal_return:player/armors/clear
execute if entity @s[tag=hide_in_bush] run effect give @s invisibility 1 1 true

# 잔디 밖에 있을 때
execute unless entity @s[tag=hide_in_bush] run effect clear @s invisibility
execute unless entity @s[tag=hide_in_bush] if items entity @s armor.head #iron_armor run function eternal_return:player/armors/set_iron_texture
