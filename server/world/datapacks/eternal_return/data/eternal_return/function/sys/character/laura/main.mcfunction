execute if entity @a[tag=laura] as @a[tag=laura] run function eternal_return:sys/character/laura/main2

## 아야 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=lauraskill] as @a[tag=lauraskill] unless entity @s[tag=laura] run tag @s remove lauraskill
execute if entity @a[tag=lauracool] as @a[tag=lauracool] unless entity @s[tag=laura] run tag @s remove lauracool