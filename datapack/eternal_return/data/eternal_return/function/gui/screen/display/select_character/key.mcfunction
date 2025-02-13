## 키 입력
# 상위 함수 : function eternal_return:gui/screen/display/select_character

    # 슬롯 범위 이동 제한 (1~31)
        execute if score @s Page.slot matches ..1 run scoreboard players set @s Page.slot 1
        execute if score @s Page.slot >= #charater.count+1 NUM run scoreboard players operation @s Page.slot = #charater.count+1 NUM
    # WASD (W/S : 상하 한 줄씩 이동, A/D : 좌우 한 칸씩 이동)
        execute if score @s[tag=Wkey] Page.slot matches 6.. if score @s Page.slot <= #charater.count+1 NUM \
                run scoreboard players remove @s Page.slot 5
        execute if score @s[tag=Skey] Page.slot matches 1.. if score @s Page.slot <= #charater.count-4 NUM \
                run scoreboard players add @s Page.slot 5
        execute if score @s[tag=Akey] Page.slot matches 2.. if score @s Page.slot <= #charater.count+1 NUM \
                run scoreboard players remove @s Page.slot 1
        execute if score @s[tag=Dkey] Page.slot matches 1.. if score @s Page.slot <= #charater.count NUM \
                run scoreboard players add @s Page.slot 1

    # Mouse Scroll Up/Down (좌우 한 칸씩 이동)
        execute if score @s[tag=scroll_up] Page.slot matches 2.. if score @s Page.slot <= #charater.count+1 NUM \
                run scoreboard players remove @s Page.slot 1
        execute if score @s[tag=scroll_down] Page.slot matches 1.. if score @s Page.slot <= #charater.count NUM \
                run scoreboard players add @s Page.slot 1

    # F키 (캐릭터 선택)
        execute if score @s[tag=select_Fkey] Page.num matches 1 run scoreboard players set @s Page.ct 10
        execute if score @s[tag=select_Fkey] Page.num matches 1 run scoreboard players set @s Page.num 2