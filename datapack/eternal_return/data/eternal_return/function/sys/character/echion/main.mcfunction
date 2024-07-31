execute if entity @a[tag=echion] as @a[tag=echion] run function eternal_return:sys/character/echion/main2

## 아야 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=echionskill] as @a[tag=echionskill] unless entity @s[tag=echion] run tag @s remove echionskill
execute if entity @a[tag=echioncool] as @a[tag=echioncool] unless entity @s[tag=echion] run tag @s remove echioncool
execute if entity @a[tag=echionrest] as @a[tag=echionrest] unless entity @s[tag=echion] run tag @s remove echionrest
execute if entity @a[scores={echionskill=1..}] as @a[scores={echionskill=1..}] unless entity @s[tag=echion] run scoreboard players reset @s echionskill