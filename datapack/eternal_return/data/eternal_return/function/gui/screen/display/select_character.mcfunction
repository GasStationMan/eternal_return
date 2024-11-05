#
#   사용되는 시점 : 캐릭터를 선택할 때
#   필요 스코어보드 : Page.num == 1
#   화면 전환 방식 : fade
#

function pdb:get_me

## 화면
    # 보스바
    $bossbar set line1.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [{"text":"25","font":"gui/late_time","color":"aqua"}]
    $bossbar set line2.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [ \
    {"interpret":true,"nbt":"in.character_array_frame[0][0]","storage":"pdb:main","color":"#4e5c24","font":"minecraft:default"},{"translate":"space.7","font":"minecraft:default"}, \
    {"interpret":true,"nbt":"in.character_array_frame[0][1]","storage":"pdb:main","color":"#4e5c24","font":"minecraft:default"},{"translate":"space.7","font":"minecraft:default"}, \
    {"interpret":true,"nbt":"in.character_array_frame[0][2]","storage":"pdb:main","color":"#4e5c24","font":"minecraft:default"},{"translate":"space.7","font":"minecraft:default"}, \
    {"interpret":true,"nbt":"in.character_array_frame[0][3]","storage":"pdb:main","color":"#4e5c24","font":"minecraft:default"},{"translate":"space.7","font":"minecraft:default"}, \
    {"interpret":true,"nbt":"in.character_array_frame[0][4]","storage":"pdb:main","color":"#4e5c24","font":"minecraft:default"}]
    $bossbar set line2.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [ \
    {"interpret":true,"nbt":"in.character_array_frame[1][0]","storage":"pdb:main","color":"#4e5c24","font":"minecraft:default"},{"translate":"space.7","font":"minecraft:default"}, \
    {"interpret":true,"nbt":"in.character_array_frame[1][1]","storage":"pdb:main","color":"#4e5c24","font":"minecraft:default"},{"translate":"space.7","font":"minecraft:default"}, \
    {"interpret":true,"nbt":"in.character_array_frame[1][2]","storage":"pdb:main","color":"#4e5c24","font":"minecraft:default"},{"translate":"space.7","font":"minecraft:default"}, \
    {"interpret":true,"nbt":"in.character_array_frame[1][3]","storage":"pdb:main","color":"#4e5c24","font":"minecraft:default"},{"translate":"space.7","font":"minecraft:default"}, \
    {"interpret":true,"nbt":"in.character_array_frame[1][4]","storage":"pdb:main","color":"#4e5c24","font":"minecraft:default"}]
    $bossbar set line2.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [ \
    {"interpret":true,"nbt":"in.character_array_frame[2][0]","storage":"pdb:main","color":"#4e5c24","font":"minecraft:default"},{"translate":"space.7","font":"minecraft:default"}, \
    {"interpret":true,"nbt":"in.character_array_frame[2][1]","storage":"pdb:main","color":"#4e5c24","font":"minecraft:default"},{"translate":"space.7","font":"minecraft:default"}, \
    {"interpret":true,"nbt":"in.character_array_frame[2][2]","storage":"pdb:main","color":"#4e5c24","font":"minecraft:default"},{"translate":"space.7","font":"minecraft:default"}, \
    {"interpret":true,"nbt":"in.character_array_frame[2][3]","storage":"pdb:main","color":"#4e5c24","font":"minecraft:default"},{"translate":"space.7","font":"minecraft:default"}, \
    {"interpret":true,"nbt":"in.character_array_frame[2][4]","storage":"pdb:main","color":"#4e5c24","font":"minecraft:default"}]
    $bossbar set line5.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name ""
    $bossbar set line6.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name ""

    # 액션바
        title @s actionbar [{"text":"4","font":"gui/image","color":"#4e5c24"}]

    # 타이틀

## 키 입력
        execute if score @s Page.slot matches ..1 run scoreboard players set @s Page.slot 1
        execute if score @s Page.slot matches 31.. run scoreboard players set @s Page.slot 31
    # WASD
        execute if score @s[tag=Wkey] Page.slot matches 6..31 run scoreboard players remove @s Page.slot 5
        execute if score @s[tag=Skey] Page.slot matches 1..26 run scoreboard players add @s Page.slot 5
        execute if score @s[tag=Akey] Page.slot matches 2..31 run scoreboard players remove @s Page.slot 1
        execute if score @s[tag=Dkey] Page.slot matches 1..30 run scoreboard players add @s Page.slot 1

    # Q key

    # F key

    # Mouse Rclick

    # Mouse Scroll Up/Down
        execute if score @s[tag=scroll_up] Page.slot matches 2..31 run scoreboard players remove @s Page.slot 1
        execute if score @s[tag=scroll_down] Page.slot matches 1..30 run scoreboard players add @s Page.slot 1

# 캐릭터가 선택됨 표시로 변경
function eternal_return:gui/screen/display/select_character/change_to_selected_num

# 캐릭터 데이터에서 프레임에 넣은 3줄만 가져오기
function eternal_return:gui/screen/display/select_character/get_inframe_char

# 캐릭터 스크롤 변경
function eternal_return:gui/screen/display/select_character/is_scrollable

# camera_overlay
    # 머리
    execute if score @s Page.frame matches 1 run \
        item replace entity @s armor.head with \
        paper[equippable={slot:"head",equip_sound:"ui.toast.in",model:"none",camera_overlay:"font/character/bg_ui_scroll1"},item_model="air"] 1
    execute if score @s Page.frame matches 2 run \
        item replace entity @s armor.head with \
        paper[equippable={slot:"head",equip_sound:"ui.toast.in",model:"none",camera_overlay:"font/character/bg_ui_scroll2"},item_model="air"] 1
    execute if score @s Page.frame matches 3 run \
        item replace entity @s armor.head with \
        paper[equippable={slot:"head",equip_sound:"ui.toast.in",model:"none",camera_overlay:"font/character/bg_ui_scroll3"},item_model="air"] 1
    execute if score @s Page.frame matches 4 run \
        item replace entity @s armor.head with \
        paper[equippable={slot:"head",equip_sound:"ui.toast.in",model:"none",camera_overlay:"font/character/bg_ui_scroll4"},item_model="air"] 1
    execute if score @s Page.frame matches 5 run \
        item replace entity @s armor.head with \
        paper[equippable={slot:"head",equip_sound:"ui.toast.in",model:"none",camera_overlay:"font/character/bg_ui_scroll5"},item_model="air"] 1