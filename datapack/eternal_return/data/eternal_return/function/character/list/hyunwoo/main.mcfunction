execute if entity @a[tag=hyunwoo] as @a[tag=hyunwoo] run function eternal_return:sys/character/hyunwoo/main2

## 현우 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=hyunwooskill] as @a[tag=hyunwooskill] unless entity @s[tag=hyunwoo] run tag @s remove hyunwooskill
execute if entity @a[tag=hyunwoocool] as @a[tag=hyunwoocool] unless entity @s[tag=hyunwoo] run tag @s remove hyunwoocool
execute if entity @a[scores={hyunwooskill=1..}] as @a[scores={hyunwooskill=1..}] unless entity @s[tag=hyunwoo] run scoreboard players reset @s hyunwooskill