## 보스바
# temp id 저장
function eternal_return:temp/input/id

## 기초 태그
# 보스바 추가
execute if entity @s[tag=add_bossbar] run function eternal_return:sys/bossbar/set/add with storage player_data temp[0]
# 보스바 제거
execute if entity @s[tag=remove_bossbar] run function eternal_return:sys/bossbar/set/remove with storage player_data temp[0]
# 보스바 나타내기
execute if entity @s[tag=show_bossbar] run function eternal_return:sys/bossbar/set/show with storage player_data temp[0]
# 보스바 숨기기
execute if entity @s[tag=hide_bossbar] run function eternal_return:sys/bossbar/set/hide with storage player_data temp[0]
# 보스바 비우기
execute if entity @s[tag=clear_bossbar] run function eternal_return:sys/bossbar/clear/all with storage player_data temp[0]



## 표기 태그
execute if entity @s[tag=ingame_ui] run function eternal_return:sys/bossbar/display/interface with storage player_data temp[0]
execute if entity @s[tag=wait_bar,tag=!now_bar] run function eternal_return:sys/bossbar/display/wait_bar with storage player_data temp[0]
execute if entity @s[tag=now_bar] run function eternal_return:sys/bossbar/display/now_bar with storage player_data temp[0]


# 표기 태그를 가지고 있지 않을 때
#execute if entity @s[tag=!ingame_ui] run function eternal_return:sys/bossbar/display/empty12 with storage player_data temp[0]
#execute if entity @s[tag=!wait_bar,tag=!now_bar] run function eternal_return:sys/bossbar/display/empty34 with storage player_data temp[0]

# 플레이어가 게임을 나갔다 들어왔을 때
execute if entity @s[tag=!first_join] run function eternal_return:sys/bossbar/leave_game


## 태그 제거
tag @s[tag=clear_bossbar] remove clear_bossbar
tag @s[tag=add_bossbar] remove add_bossbar
tag @s[tag=remove_bossbar] remove remove_bossbar
tag @s[tag=show_bossbar] remove show_bossbar
tag @s[tag=hide_bossbar] remove hide_bossbar


# temp id 초기화
function eternal_return:temp/free/id