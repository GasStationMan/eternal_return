## 셀린 바라보는 방향 감지
execute if entity @s[tag=celine_t1] at @s positioned ~ ~1.25 ~ rotated as @s run summon marker ^ ^ ^ {Tags:["celine_facing","celine_facing_t1"]}
execute if entity @s[tag=celine_t2] at @s positioned ~ ~1.25 ~ rotated as @s run summon marker ^ ^ ^ {Tags:["celine_facing","celine_facing_t2"]}
execute as @e[tag=celine_facing] at @s run function eternal_return:character/list/celine/passive/celine_facing
execute if entity @s[nbt={SelectedItem:{id:"minecraft:iron_sword"}}] as @e[tag=celine_facing_last] at @s run particle dust{color:[1.000,0.000,0.000],scale:1} ~ ~0.1 ~ 0 0 0 0 1 force @a[tag=celine]

execute if entity @s[tag=rightclick,tag=!passive_cool,tag=celine_t2] at @s if entity @e[tag=celine_facing_last_t2] run function eternal_return:character/list/celine/passive/active
execute if entity @s[tag=rightclick,tag=!passive_cool,tag=celine] at @s run say 1

function eternal_return:character/list/celine/passive/skill

## 무기 증정
# /give @p iron_sword[custom_data={tags:"weapon"},food={nutrition:0,saturation:0,can_always_eat:true},consumable={consume_seconds:1000000}] 1