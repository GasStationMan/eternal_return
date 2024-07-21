
#> function eternal_return:entity/main

#> 야생동물 스폰 포인트 제어
execute if entity @s[type= minecraft:marker, tag= ER.spawn.animal] positioned as @s if entity @p[distance=..40] run function eternal_return:entity/animal_spawn/main

#> 히트박스
execute if entity @s[type= minecraft:ghast, tag= ER.animal.hitbox] if score @s ER.health matches 1.. positioned as @s if entity @p[distance=..40] run function eternal_return:entity/hitbox/main

#> 야생동물 스크립트
# 멧돼지
execute if entity @s[type= minecraft:zombie, tag= ER.animal.root ,tag= ER.animal.boar ] run function eternal_return:entity/animal/boar/script/main
# 곰
execute if entity @s[type= minecraft:zombie, tag= ER.animal.root ,tag= ER.animal.bear ] run function eternal_return:entity/animal/bear/script/main
# 늑대
execute if entity @s[type= minecraft:zombie, tag= ER.animal.root ,tag= ER.animal.wolf ] run function eternal_return:entity/animal/wolf/script/main
# 알파
execute if entity @s[type= minecraft:zombie, tag= ER.animal.root ,tag= ER.animal.alpha] run function eternal_return:entity/animal/alpha/script/main
