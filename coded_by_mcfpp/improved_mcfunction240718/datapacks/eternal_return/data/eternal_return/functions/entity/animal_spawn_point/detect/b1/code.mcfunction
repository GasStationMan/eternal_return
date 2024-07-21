scoreboard players set @s click 0
execute if data entity @s SelectedItem:{components:{"minecraft:custom_data":{summon:"ER.animal.boar"}}} run return run function eternal_return:entity/animal_spawn_point/detect/b1/b1/code
execute if data entity @s SelectedItem:{components:{"minecraft:custom_data":{summon:"ER.animal.bear"}}} run return run function eternal_return:entity/animal_spawn_point/detect/b1/b2/code
execute if data entity @s SelectedItem:{components:{"minecraft:custom_data":{summon:"ER.animal.wolf"}}} run return run function eternal_return:entity/animal_spawn_point/detect/b1/b3/code
execute if data entity @s SelectedItem:{components:{"minecraft:custom_data":{summon:"ER.animal.alpha"}}} run return run function eternal_return:entity/animal_spawn_point/detect/b1/b4/code
