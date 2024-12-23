
# 보어를 소환할 아머 마커를 소환하는 함수입니다.
#> function eternal_return:entity/animal_spawn_point/main


if score @s click matches 1.. :
    
    set @s click 0

    if data entity @s SelectedItem:{components:{"minecraft:custom_data":{summon:"ER.animal.boar"}}} run return run function :
        function eternal_return:entity/animal_spawn_point/summon/main {animal:"boar"}

    if data entity @s SelectedItem:{components:{"minecraft:custom_data":{summon:"ER.animal.bear"}}} run return run function :
        function eternal_return:entity/animal_spawn_point/summon/main {animal:"bear"}

    if data entity @s SelectedItem:{components:{"minecraft:custom_data":{summon:"ER.animal.wolf"}}} run return run function :
        function eternal_return:entity/animal_spawn_point/summon/main {animal:"wolf"}

    if data entity @s SelectedItem:{components:{"minecraft:custom_data":{summon:"ER.animal.alpha"}}} run return run function :
        function eternal_return:entity/animal_spawn_point/summon/main {animal:"alpha"}


