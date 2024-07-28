# 날짜 입력 받기
$scoreboard players set #input.life_of_tree.day NUM $(day)


# 에러 메시지
$execute unless score #input.life_of_tree.day NUM matches 2..3 run tellraw @s [{"text":"$(day)일차에는 생명의 나무를 소환할 수 없습니다","color":"red"}]
execute if score #tree_of_life.summon CT1 matches 1..599 run tellraw @s [{"text":"생명의 나무를 이미 소환하고 있습니다","color":"red"}]

## 스코어 부여
# 일차 별 텍스트 출력
execute unless score #tree_of_life.summon CT1 matches 1..599 if score #input.life_of_tree.day NUM matches 2 run function eternal_return:send_msg {target:"@a",text:'{"text":"30초 후에 호텔, 묘지, 절에서 생명의 나무가 나타납니다."}',color:"gold",timer:1}
execute unless score #tree_of_life.summon CT1 matches 1..599 if score #input.life_of_tree.day NUM matches 3 run function eternal_return:send_msg {target:"@a",text:'{"text":"30초 후에 숲, 개울에서 생명의 나무가 나타납니다."}',color:"gold",timer:1}
# 도전과제 표시
execute unless score #tree_of_life.summon CT1 matches 1..599 if score #input.life_of_tree.day NUM matches 2..3 run advancement revoke @a only eternal_return:tree_of_life_30
execute unless score #tree_of_life.summon CT1 matches 1..599 if score #input.life_of_tree.day NUM matches 2..3 run advancement grant @a only eternal_return:tree_of_life_30
# 스코어 부여
execute unless score #tree_of_life.summon CT1 matches 1..599 if score #input.life_of_tree.day NUM matches 2..3 run scoreboard players set #tree_of_life.summon CT1 1
