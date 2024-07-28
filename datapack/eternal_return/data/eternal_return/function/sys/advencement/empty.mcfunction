## 빈 도전과제 띄위기
# 갯수 입력받기
$scoreboard players set #input.count_empty CT1 $(count)

# 도전과제 초기화
execute if score #input.count_empty CT1 matches 1..4 run advancement revoke @a everything

# 1개
execute if score #input.count_empty CT1 matches 1 run advancement grant @a only eternal_return:empty
# 2개
execute if score #input.count_empty CT1 matches 2 run advancement grant @a only eternal_return:empty
execute if score #input.count_empty CT1 matches 2 run advancement grant @a only eternal_return:empty1
# 3개
execute if score #input.count_empty CT1 matches 3 run advancement grant @a only eternal_return:empty
execute if score #input.count_empty CT1 matches 3 run advancement grant @a only eternal_return:empty1
execute if score #input.count_empty CT1 matches 3 run advancement grant @a only eternal_return:empty2
# 4개
execute if score #input.count_empty CT1 matches 4 run advancement grant @a only eternal_return:empty
execute if score #input.count_empty CT1 matches 4 run advancement grant @a only eternal_return:empty1
execute if score #input.count_empty CT1 matches 4 run advancement grant @a only eternal_return:empty2
execute if score #input.count_empty CT1 matches 4 run advancement grant @a only eternal_return:empty3

# 갯수 스코어 초기화
scoreboard players reset #input.count_empty