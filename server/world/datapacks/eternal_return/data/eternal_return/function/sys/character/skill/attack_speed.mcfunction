execute as @a[nbt={SelectedItem:{id:"minecraft:diamond_sword"}}] run attribute @s minecraft:generic.attack_speed base set 1.6
execute as @a[nbt={SelectedItem:{id:"minecraft:iron_sword"}}] run attribute @s minecraft:generic.attack_speed base set 1.6

execute as @a unless entity @s[nbt={SelectedItem:{id:"minecraft:diamond_sword"}}] run attribute @s minecraft:generic.attack_speed base set 4
execute as @a unless entity @s[nbt={SelectedItem:{id:"minecraft:iron_sword"}}] run attribute @s minecraft:generic.attack_speed base set 4