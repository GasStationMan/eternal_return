execute if entity @a[tag=silvia] as @a[tag=silvia] run function eternal_return:sys/character/silvia/main2

## 시셀라 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=silviaskill] as @a[tag=silviaskill] unless entity @s[tag=silvia] run tag @s remove silviaskill