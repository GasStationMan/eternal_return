function pdb:get_uuid
data modify storage minecraft:temp temp.UUID0 set from storage pdb:main args.UUID0
data modify storage minecraft:temp temp.UUID1 set from storage pdb:main args.UUID1
data modify storage minecraft:temp temp.UUID2 set from storage pdb:main args.UUID2
data modify storage minecraft:temp temp.UUID3 set from storage pdb:main args.UUID3
function df_lib:hud/show/b2/b4/code with storage minecraft:temp temp
tag @s remove choosing_kiosk
data remove storage minecraft:temp temp
