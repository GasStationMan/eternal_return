execute if entity @a[tag=arda] as @a[tag=arda] run function eternal_return:sys/character/arda/main2

## 아르다 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=ardaskill] as @a[tag=ardaskill] unless entity @s[tag=arda] run tag @s remove ardaskill