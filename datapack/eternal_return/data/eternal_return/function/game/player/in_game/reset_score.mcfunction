## 게임 시작전 스코어보드 초기화
# 상위 함수 : function eternal_return:game/system/in_game
# 입출력 : 없음

# 스코어보드
    scoreboard players set @a[tag=in_game] level 1
    scoreboard players set @a[tag=in_game] skill_exp 0
    scoreboard players set @a[tag=in_game] skill_exp_image 0
    scoreboard players set @a[tag=in_game] skill_point 1
    scoreboard players set @a[tag=in_game] active_level 0
    scoreboard players set @a[tag=in_game] passive_level 0
    scoreboard players set @a[tag=in_game] credit 0