## 셀린 바라보는 방향 감지
execute if entity @s[tag=celine_t1] at @s positioned ~ ~1.25 ~ rotated as @s run summon marker ^ ^ ^ {Tags:["celine_facing","celine_facing_t1"]}
execute if entity @s[tag=celine_t2] at @s positioned ~ ~1.25 ~ rotated as @s run summon marker ^ ^ ^ {Tags:["celine_facing","celine_facing_t2"]}
execute if entity @s[tag=celine_t3] at @s positioned ~ ~1.25 ~ rotated as @s run summon marker ^ ^ ^ {Tags:["celine_facing","celine_facing_t3"]}
execute if entity @s[tag=celine_t4] at @s positioned ~ ~1.25 ~ rotated as @s run summon marker ^ ^ ^ {Tags:["celine_facing","celine_facing_t4"]}
execute if entity @s[tag=celine_t5] at @s positioned ~ ~1.25 ~ rotated as @s run summon marker ^ ^ ^ {Tags:["celine_facing","celine_facing_t5"]}
execute if entity @s[tag=celine_t6] at @s positioned ~ ~1.25 ~ rotated as @s run summon marker ^ ^ ^ {Tags:["celine_facing","celine_facing_t6"]}
execute if entity @s[tag=celine_t7] at @s positioned ~ ~1.25 ~ rotated as @s run summon marker ^ ^ ^ {Tags:["celine_facing","celine_facing_t7"]}
execute if entity @s[tag=celine_t8] at @s positioned ~ ~1.25 ~ rotated as @s run summon marker ^ ^ ^ {Tags:["celine_facing","celine_facing_t8"]}
execute if entity @s[tag=celine_t9] at @s positioned ~ ~1.25 ~ rotated as @s run summon marker ^ ^ ^ {Tags:["celine_facing","celine_facing_t9"]}
execute if entity @s[tag=celine_t10] at @s positioned ~ ~1.25 ~ rotated as @s run summon marker ^ ^ ^ {Tags:["celine_facing","celine_facing_t10"]}
execute if entity @s[tag=celine_t11] at @s positioned ~ ~1.25 ~ rotated as @s run summon marker ^ ^ ^ {Tags:["celine_facing","celine_facing_t11"]}
execute if entity @s[tag=celine_t12] at @s positioned ~ ~1.25 ~ rotated as @s run summon marker ^ ^ ^ {Tags:["celine_facing","celine_facing_t12"]}
execute if entity @s[tag=celine_t13] at @s positioned ~ ~1.25 ~ rotated as @s run summon marker ^ ^ ^ {Tags:["celine_facing","celine_facing_t13"]}
execute if entity @s[tag=celine_t14] at @s positioned ~ ~1.25 ~ rotated as @s run summon marker ^ ^ ^ {Tags:["celine_facing","celine_facing_t14"]}
execute if entity @s[tag=celine_t15] at @s positioned ~ ~1.25 ~ rotated as @s run summon marker ^ ^ ^ {Tags:["celine_facing","celine_facing_t15"]}
execute if entity @s[tag=celine_t16] at @s positioned ~ ~1.25 ~ rotated as @s run summon marker ^ ^ ^ {Tags:["celine_facing","celine_facing_t16"]}

execute as @e[tag=celine_facing] at @s run function eternal_return:character/list/celine/passive/celine_facing
execute if entity @s[tag=celine_t1,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] as @e[tag=celine_facing_last_t1] at @s run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~0.1 ~ 0 0 0 0 1 force @a[tag=celine_t1]
execute if entity @s[tag=celine_t2,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] as @e[tag=celine_facing_last_t2] at @s run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~0.1 ~ 0 0 0 0 1 force @a[tag=celine_t2]
execute if entity @s[tag=celine_t3,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] as @e[tag=celine_facing_last_t3] at @s run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~0.1 ~ 0 0 0 0 1 force @a[tag=celine_t3]
execute if entity @s[tag=celine_t4,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] as @e[tag=celine_facing_last_t4] at @s run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~0.1 ~ 0 0 0 0 1 force @a[tag=celine_t4]
execute if entity @s[tag=celine_t5,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] as @e[tag=celine_facing_last_t5] at @s run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~0.1 ~ 0 0 0 0 1 force @a[tag=celine_t5]
execute if entity @s[tag=celine_t6,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] as @e[tag=celine_facing_last_t6] at @s run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~0.1 ~ 0 0 0 0 1 force @a[tag=celine_t6]
execute if entity @s[tag=celine_t7,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] as @e[tag=celine_facing_last_t7] at @s run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~0.1 ~ 0 0 0 0 1 force @a[tag=celine_t7]
execute if entity @s[tag=celine_t8,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] as @e[tag=celine_facing_last_t8] at @s run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~0.1 ~ 0 0 0 0 1 force @a[tag=celine_t8]
execute if entity @s[tag=celine_t9,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] as @e[tag=celine_facing_last_t9] at @s run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~0.1 ~ 0 0 0 0 1 force @a[tag=celine_t9]
execute if entity @s[tag=celine_t10,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] as @e[tag=celine_facing_last_t10] at @s run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~0.1 ~ 0 0 0 0 1 force @a[tag=celine_t10]
execute if entity @s[tag=celine_t11,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] as @e[tag=celine_facing_last_t11] at @s run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~0.1 ~ 0 0 0 0 1 force @a[tag=celine_t11]
execute if entity @s[tag=celine_t12,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] as @e[tag=celine_facing_last_t12] at @s run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~0.1 ~ 0 0 0 0 1 force @a[tag=celine_t12]
execute if entity @s[tag=celine_t13,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] as @e[tag=celine_facing_last_t13] at @s run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~0.1 ~ 0 0 0 0 1 force @a[tag=celine_t13]
execute if entity @s[tag=celine_t14,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] as @e[tag=celine_facing_last_t14] at @s run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~0.1 ~ 0 0 0 0 1 force @a[tag=celine_t14]
execute if entity @s[tag=celine_t15,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] as @e[tag=celine_facing_last_t15] at @s run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~0.1 ~ 0 0 0 0 1 force @a[tag=celine_t15]
execute if entity @s[tag=celine_t16,nbt={SelectedItem:{id:"minecraft:iron_sword"}}] as @e[tag=celine_facing_last_t16] at @s run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~0.1 ~ 0 0 0 0 1 force @a[tag=celine_t16]


execute if entity @s[tag=Fskill,tag=!passive_cool,tag=celine] at @s if entity @e[tag=celine_facing_last] run function eternal_return:character/list/celine/passive/active


function eternal_return:character/list/celine/passive/skill

## 무기 증정
# /give @p iron_sword[custom_data={tags:"weapon"},food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:1000000}] 1