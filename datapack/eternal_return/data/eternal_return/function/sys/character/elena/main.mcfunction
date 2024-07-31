execute if entity @a[tag=elena] as @a[tag=elena] run function eternal_return:sys/character/elena/main2

## 아야 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=elenaskill] as @a[tag=elenaskill] unless entity @s[tag=elena] run tag @s remove elenaskill
execute if entity @a[tag=elenacool] as @a[tag=elenacool] unless entity @s[tag=elena] run tag @s remove elenacool