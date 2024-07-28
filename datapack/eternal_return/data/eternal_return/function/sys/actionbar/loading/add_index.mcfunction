## 로딩바 채우기
$function eternal_return:temp/input/index {name:"#$(id).loading.index"}
# 
$execute if entity @s[tag=loading1.5] if score #$(id).loading.index CT1 matches 1..29 run scoreboard players add #$(id).loading.index CT1 1
$execute if entity @s[tag=loading3] if score #$(id).loading.index CT1 matches 1..59 run scoreboard players add #$(id).loading.index CT1 1
$execute if entity @s[tag=loading7] if score #$(id).loading.index CT1 matches ..72 run scoreboard players add #$(id).loading.index CT1 1

$execute if entity @s[tag=loading7,tag=!charge2] if score #$(id).loading.index CT1 matches 73 run tag @s add charge2
$execute if entity @s[tag=loading7,tag=charge2] if score #$(id).loading.index CT1 matches 73 run scoreboard players set #$(id).loading.index CT1 1

# Id, index를 temp3에 복제
$data modify storage minecraft:player_data temp[3].id set value $(id)
data modify storage minecraft:player_data temp[3].index set from storage minecraft:player_data temp[2].index

$execute if score #$(id).loading.index CT1 matches 1.. run function eternal_return:sys/actionbar/loading/charge with storage minecraft:player_data temp[3]


# temp free
data modify storage minecraft:player_data temp[3] set value {}
function eternal_return:temp/free/index