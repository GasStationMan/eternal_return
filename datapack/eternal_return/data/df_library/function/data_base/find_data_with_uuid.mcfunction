data modify storage minecraft:userinfo Temp set from storage minecraft:userinfo Players[0]
data remove storage minecraft:userinfo Players[0]
data modify storage minecraft:userinfo Players append from storage minecraft:userinfo Temp

execute as @s store result score #UUID1 UUID1 run data get entity @s UUID[0]
execute as @s store result score #UUID2 UUID2 run data get entity @s UUID[1]
execute as @s store result score #UUID3 UUID3 run data get entity @s UUID[2]
execute as @s store result score #UUID4 UUID4 run data get entity @s UUID[3]

execute as @s store result score #UUID1_target UUID1 run data get storage minecraft:userinfo Players[0].UUID[0]
execute as @s store result score #UUID2_target UUID2 run data get storage minecraft:userinfo Players[0].UUID[1]
execute as @s store result score #UUID3_target UUID3 run data get storage minecraft:userinfo Players[0].UUID[2]
execute as @s store result score #UUID4_target UUID4 run data get storage minecraft:userinfo Players[0].UUID[3]

execute unless score #UUID1_target UUID1 = #UUID1 UUID1 run function df_library:data_base/find_data_with_uuid 
execute unless score #UUID2_target UUID2 = #UUID2 UUID2 run function df_library:data_base/find_data_with_uuid 
execute unless score #UUID3_target UUID3 = #UUID3 UUID3 run function df_library:data_base/find_data_with_uuid 
execute unless score #UUID4_target UUID4 = #UUID4 UUID4 run function df_library:data_base/find_data_with_uuid 
