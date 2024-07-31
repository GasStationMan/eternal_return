## 스크롤 움직임 감지
    # UP
        execute if score #temp.now_scroll_num NUM matches 8 if score #temp.now_scroll_num_old NUM matches 0 run tag @s add ER.scroll_up
        execute if score #temp.now_scroll_num NUM matches 0 if score #temp.now_scroll_num_old NUM matches 1 run tag @s add ER.scroll_up
        execute if score #temp.now_scroll_num NUM matches 0..1 if score #temp.now_scroll_num_old NUM matches 2 run tag @s add ER.scroll_up
        execute if score #temp.now_scroll_num NUM matches 0..2 if score #temp.now_scroll_num_old NUM matches 3 run tag @s add ER.scroll_up
        execute if score #temp.now_scroll_num NUM matches 1..3 if score #temp.now_scroll_num_old NUM matches 4 run tag @s add ER.scroll_up
        execute if score #temp.now_scroll_num NUM matches 2..4 if score #temp.now_scroll_num_old NUM matches 5 run tag @s add ER.scroll_up
        execute if score #temp.now_scroll_num NUM matches 3..5 if score #temp.now_scroll_num_old NUM matches 6 run tag @s add ER.scroll_up
        execute if score #temp.now_scroll_num NUM matches 4..6 if score #temp.now_scroll_num_old NUM matches 7 run tag @s add ER.scroll_up
        execute if score #temp.now_scroll_num NUM matches 5..7 if score #temp.now_scroll_num_old NUM matches 8 run tag @s add ER.scroll_up

    # DOWN
        execute if score #temp.now_scroll_num NUM matches 0..2 if score #temp.now_scroll_num_old NUM matches 8 run tag @s add ER.scroll_down
        execute if score #temp.now_scroll_num NUM matches 1..3 if score #temp.now_scroll_num_old NUM matches 0 run tag @s add ER.scroll_down
        execute if score #temp.now_scroll_num NUM matches 2..4 if score #temp.now_scroll_num_old NUM matches 1 run tag @s add ER.scroll_down
        execute if score #temp.now_scroll_num NUM matches 3..5 if score #temp.now_scroll_num_old NUM matches 2 run tag @s add ER.scroll_down
        execute if score #temp.now_scroll_num NUM matches 4..6 if score #temp.now_scroll_num_old NUM matches 3 run tag @s add ER.scroll_down
        execute if score #temp.now_scroll_num NUM matches 5..7 if score #temp.now_scroll_num_old NUM matches 4 run tag @s add ER.scroll_down
        execute if score #temp.now_scroll_num NUM matches 6..8 if score #temp.now_scroll_num_old NUM matches 5 run tag @s add ER.scroll_down
        execute if score #temp.now_scroll_num NUM matches 7 if score #temp.now_scroll_num_old NUM matches 6 run tag @s add ER.scroll_down
        execute if score #temp.now_scroll_num NUM matches 8 if score #temp.now_scroll_num_old NUM matches 7 run tag @s add ER.scroll_down