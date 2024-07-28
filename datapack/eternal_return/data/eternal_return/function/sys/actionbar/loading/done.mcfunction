$execute if entity @s[tag=loading1.5] if score #$(id).loading.index CT1 matches 30 run tag @s add clear_loading
$execute if entity @s[tag=loading1.5] if score #$(id).loading.index CT1 matches 30 run tag @s add done_loading
$execute if entity @s[tag=loading3] if score #$(id).loading.index CT1 matches 60 run tag @s add clear_loading
$execute if entity @s[tag=loading3] if score #$(id).loading.index CT1 matches 60 run tag @s add done_loading
$execute if entity @s[tag=loading7,tag=charge2] if score #$(id).loading.index CT1 matches 70.. run tag @s add done_loading
$execute if entity @s[tag=loading7,tag=charge2] if score #$(id).loading.index CT1 matches 70.. run tag @s add clear_loading