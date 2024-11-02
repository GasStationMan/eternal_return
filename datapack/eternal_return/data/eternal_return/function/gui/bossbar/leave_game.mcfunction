## 게임에서 나갔을 때
function pdb:get_me

# 보스바 재표시
execute if score @s quit matches 1.. run function eternal_return:gui/bossbar/hide with storage pdb:main args
execute if score @s quit matches 1.. run function eternal_return:gui/bossbar/show with storage pdb:main args

# 스코어 초기화
execute if score @s quit matches 1.. run scoreboard players set @s quit 0