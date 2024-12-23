data modify storage minecraft:list arr set value { 0: 30, 1: 29, 2: 28, 3: 27, 4: 26, 5: 25, 6: 24, 7: 23, 8: 22, 9: 21, 10:20, 11:19, 12:18, 13:17, 14:16, 15:15, 16:14, 17:13, 18:12, 19:11, 20:10, 21:9, 22:8, 23:7, 24:6, 25:5, 26:4, 27:3, 28:2, 29:1, }
execute store result score #len sys run data get storage minecraft:list arr
scoreboard players set #i sys 0
function test:bubble_sort_opt/b1/code
