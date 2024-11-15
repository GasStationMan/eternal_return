## 캐릭터 선택화면 프레임별 스크린 배경 바꾸기
# 입출력 없음
# 상위 함수 : eternal_return/function/gui/screen/display/select_character

# 머리 슬롯 (스크롤 배경)
    execute if score @s Page.frame matches 0 run \
        item replace entity @s armor.head with \
        paper[equippable={slot:"head",equip_sound:"ui.toast.in",model:"none",camera_overlay:"font/character/bg_ui_scroll0"},item_model="air"] 1
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