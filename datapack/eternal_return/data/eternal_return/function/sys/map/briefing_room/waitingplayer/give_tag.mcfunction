# 태그부여, 스코어 초기화
tag @s add waitingPlayer
scoreboard players set @s Page.num 0
execute store result score #temp.now_scroll_num NUM run data get entity @s SelectedItemSlot