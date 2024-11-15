## 스크롤 움직임 감지
# 상위 함수 : function eternal_return:gui/screen/tick
# 이전 핫바 위치와 현재 핫바 위치를 비교하여 up/down 확인

    # UP
        execute if score @s now_scroll_num matches 8 if score @s old_scroll_num matches 0 run tag @s add scroll_up
        execute if score @s now_scroll_num matches 0 if score @s old_scroll_num matches 1 run tag @s add scroll_up
        execute if score @s now_scroll_num matches 0..1 if score @s old_scroll_num matches 2 run tag @s add scroll_up
        execute if score @s now_scroll_num matches 0..2 if score @s old_scroll_num matches 3 run tag @s add scroll_up
        execute if score @s now_scroll_num matches 1..3 if score @s old_scroll_num matches 4 run tag @s add scroll_up
        execute if score @s now_scroll_num matches 2..4 if score @s old_scroll_num matches 5 run tag @s add scroll_up
        execute if score @s now_scroll_num matches 3..5 if score @s old_scroll_num matches 6 run tag @s add scroll_up
        execute if score @s now_scroll_num matches 4..6 if score @s old_scroll_num matches 7 run tag @s add scroll_up
        execute if score @s now_scroll_num matches 5..7 if score @s old_scroll_num matches 8 run tag @s add scroll_up

    # DOWN
        execute if score @s now_scroll_num matches 0..2 if score @s old_scroll_num matches 8 run tag @s add scroll_down
        execute if score @s now_scroll_num matches 1..3 if score @s old_scroll_num matches 0 run tag @s add scroll_down
        execute if score @s now_scroll_num matches 2..4 if score @s old_scroll_num matches 1 run tag @s add scroll_down
        execute if score @s now_scroll_num matches 3..5 if score @s old_scroll_num matches 2 run tag @s add scroll_down
        execute if score @s now_scroll_num matches 4..6 if score @s old_scroll_num matches 3 run tag @s add scroll_down
        execute if score @s now_scroll_num matches 5..7 if score @s old_scroll_num matches 4 run tag @s add scroll_down
        execute if score @s now_scroll_num matches 6..8 if score @s old_scroll_num matches 5 run tag @s add scroll_down
        execute if score @s now_scroll_num matches 7 if score @s old_scroll_num matches 6 run tag @s add scroll_down
        execute if score @s now_scroll_num matches 8 if score @s old_scroll_num matches 7 run tag @s add scroll_down