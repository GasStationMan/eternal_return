## 캐릭터 선택화면 보스바 표기
# 상위 함수 : function eternal_return:gui/screen/display/select_character

$bossbar set line1.$(UUID0) name [{"score":{"name":"@s","objective":"Page.sec"},"font":"gui/left_time","color":"aqua"}]
$bossbar set line2.$(UUID0) name [ \
{"interpret":true,"nbt":"show_charlist[0][0]","storage":"temp","shadow_color":0,"font":"gui/character/line1"},{"translate":"space.7","font":"minecraft:default"}, \
{"interpret":true,"nbt":"show_charlist[0][1]","storage":"temp","shadow_color":0,"font":"gui/character/line1"},{"translate":"space.7","font":"minecraft:default"}, \
{"interpret":true,"nbt":"show_charlist[0][2]","storage":"temp","shadow_color":0,"font":"gui/character/line1"},{"translate":"space.7","font":"minecraft:default"}, \
{"interpret":true,"nbt":"show_charlist[0][3]","storage":"temp","shadow_color":0,"font":"gui/character/line1"},{"translate":"space.7","font":"minecraft:default"}, \
{"interpret":true,"nbt":"show_charlist[0][4]","storage":"temp","shadow_color":0,"font":"gui/character/line1"}]
$bossbar set line3.$(UUID0) name [ \
{"interpret":true,"nbt":"show_charlist[1][0]","storage":"temp","shadow_color":0,"font":"gui/character/line2"},{"translate":"space.7","font":"minecraft:default"}, \
{"interpret":true,"nbt":"show_charlist[1][1]","storage":"temp","shadow_color":0,"font":"gui/character/line2"},{"translate":"space.7","font":"minecraft:default"}, \
{"interpret":true,"nbt":"show_charlist[1][2]","storage":"temp","shadow_color":0,"font":"gui/character/line2"},{"translate":"space.7","font":"minecraft:default"}, \
{"interpret":true,"nbt":"show_charlist[1][3]","storage":"temp","shadow_color":0,"font":"gui/character/line2"},{"translate":"space.7","font":"minecraft:default"}, \
{"interpret":true,"nbt":"show_charlist[1][4]","storage":"temp","shadow_color":0,"font":"gui/character/line2"}]
$bossbar set line4.$(UUID0) name [ \
{"interpret":true,"nbt":"show_charlist[2][0]","storage":"temp","shadow_color":0,"font":"gui/character/line3"},{"translate":"space.7","font":"minecraft:default"}, \
{"interpret":true,"nbt":"show_charlist[2][1]","storage":"temp","shadow_color":0,"font":"gui/character/line3"},{"translate":"space.7","font":"minecraft:default"}, \
{"interpret":true,"nbt":"show_charlist[2][2]","storage":"temp","shadow_color":0,"font":"gui/character/line3"},{"translate":"space.7","font":"minecraft:default"}, \
{"interpret":true,"nbt":"show_charlist[2][3]","storage":"temp","shadow_color":0,"font":"gui/character/line3"},{"translate":"space.7","font":"minecraft:default"}, \
{"interpret":true,"nbt":"show_charlist[2][4]","storage":"temp","shadow_color":0,"font":"gui/character/line3"}]
$bossbar set line5.$(UUID0) name ""
$bossbar set line6.$(UUID0) name ""

data remove storage temp show_charlist