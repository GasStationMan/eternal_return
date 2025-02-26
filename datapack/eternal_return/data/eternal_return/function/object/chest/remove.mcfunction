## 상자 제거

execute as @e[type=marker,tag=chestplace] at @s run data modify block ~ ~ ~ LootTable set value ""
execute as @e[type=marker,tag=chestplace] at @s run setblock ~ ~ ~ air replace
kill @e[type=marker,tag=chestplace]
