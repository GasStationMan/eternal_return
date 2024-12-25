execute if entity @a[tag=nicky] as @a[tag=nicky] run function eternal_return:sys/character/nicky/main2

## 니키 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=nickyskill] as @a[tag=nickyskill] unless entity @s[tag=nicky] run tag @s remove nickyskill