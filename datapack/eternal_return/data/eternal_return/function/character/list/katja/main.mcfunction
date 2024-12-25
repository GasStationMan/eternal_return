execute if entity @a[tag=katja] as @a[tag=katja] run function eternal_return:sys/character/katja/main2

## 아야 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=katjaskill] as @a[tag=katjaskill] unless entity @s[tag=katja] run tag @s remove katjaskill