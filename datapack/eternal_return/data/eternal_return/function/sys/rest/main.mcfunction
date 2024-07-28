execute as @a[tag=player,tag=!rest,tag=rightclick,nbt={SelectedItem:{id:"minecraft:red_bed",count:1}}] run tag @s add rest1
execute as @a[tag=player,tag=!rest,tag=rightclick,nbt={SelectedItem:{id:"minecraft:red_bed",count:1}}] run tellraw @s {"text":"휴식 중입니다.","color":"yellow"}
execute as @a[tag=player,tag=!rest,tag=rightclick,nbt={SelectedItem:{id:"minecraft:red_bed",count:1}}] run tag @s remove rightclick
execute as @a[tag=player,tag=rest] run effect give @s slowness infinite 100 true
execute as @a[tag=player,tag=rest] run effect give @s regeneration infinite 1 true

execute as @a[tag=player,tag=!rest,tag=rest1] run tag @s add rest
execute as @a[tag=player,tag=rest1] run tag @s remove rest1

execute as @a[tag=player,tag=rest,tag=rightclick,nbt={SelectedItem:{id:"minecraft:red_bed",count:1}}] run tag @s add rest1
execute as @a[tag=player,tag=rest,tag=rightclick,nbt={SelectedItem:{id:"minecraft:red_bed",count:1}}] run tellraw @s {"text":"휴식이 해제되었습니다.","color":"red"}
execute as @a[tag=player,tag=rest,tag=rightclick,nbt={SelectedItem:{id:"minecraft:red_bed",count:1}}] run tag @s remove rightclick
execute as @a[tag=player,tag=rest,tag=rest1] run effect clear @s slowness
execute as @a[tag=player,tag=rest,tag=rest1] run effect clear @s regeneration
execute as @a[tag=player,tag=rest,tag=rest1] run kill @e[tag=resta,limit=1,sort=nearest]
execute as @a[tag=player,tag=rest,tag=rest1] run tag @s remove rest
execute as @a[tag=player,tag=rest1] run tag @s remove rest1

execute as @a[tag=player,tag=rest,scores={restd=0..}] run tellraw @s {"text":"휴식이 해제되었습니다.","color":"red"}
execute as @a[tag=player,tag=rest,scores={restd=0..}] run effect clear @s slowness
execute as @a[tag=player,tag=rest,scores={restd=0..}] run effect clear @s regeneration
execute as @a[tag=player,tag=rest,scores={restd=0..}] run kill @e[tag=resta,limit=1,sort=nearest]
execute as @a[tag=player,tag=rest,scores={restd=0..}] run tag @s remove rest
scoreboard players reset @a[scores={restd=0..}] restd

execute as @a[tag=player,tag=rest,scores={resthit=0..}] run tellraw @s {"text":"휴식이 해제되었습니다.","color":"red"}
execute as @a[tag=player,tag=rest,scores={resthit=0..}] run effect clear @s slowness
execute as @a[tag=player,tag=rest,scores={resthit=0..}] run effect clear @s regeneration
execute as @a[tag=player,tag=rest,scores={resthit=0..}] run kill @e[tag=resta,limit=1,sort=nearest]
execute as @a[tag=player,tag=rest,scores={resthit=0..}] run tag @s remove rest
scoreboard players reset @a[scores={resthit=0..}] resthit

execute as @a[tag=player,tag=rest,scores={restj=1..}] run tellraw @s {"text":"휴식이 해제되었습니다.","color":"red"}
execute as @a[tag=player,tag=rest,scores={restj=1..}] run effect clear @s slowness
execute as @a[tag=player,tag=rest,scores={restj=1..}] run effect clear @s regeneration
execute as @a[tag=player,tag=rest,scores={restj=1..}] run kill @e[tag=resta,limit=1,sort=nearest]
execute as @a[tag=player,tag=rest,scores={restj=1..}] run tag @s remove rest
scoreboard players reset @a[scores={restj=1..}] restj
