execute if entity @a[tag=daniel] as @a[tag=daniel] run function eternal_return:sys/character/daniel/main2

## 다니엘 태그 제거 했을 때 관련 태그 제거
execute if entity @a[tag=danielskill] as @a[tag=danielskill] unless entity @s[tag=daniel] run tag @s remove danielskill