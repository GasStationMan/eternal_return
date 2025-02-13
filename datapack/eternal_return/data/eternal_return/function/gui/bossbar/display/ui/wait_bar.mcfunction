$bossbar set line5.$(UUID0) name [\
    {"text":"남은 시간 : ","font":"gui/centerbar/wait/remaining_text"},\
    {"score":{"name":"#wait.remaining","objective":"ct1"},"font":"gui/centerbar/wait/remaining_num","color":"aqua"},\
    {"text":"초","font":"gui/centerbar/wait/remaining_text","color":"white"}]

$bossbar set line4.$(UUID0) name [\
    {"score":{"name":"#wait.bg","objective":"ct1"},"font":"gui/centerbar/wait/bg","shadow_color":0},\
    {"translate":"space.-75","font":"minecraft:default"},\
    {"nbt":"temp.player","storage":"ui_temp","font":"gui/centerbar/wait/count","shadow_color":0},\
    {"text":"/16","font":"gui/centerbar/wait/count","shadow_color":0},\
    {"translate":"space.51","font":"minecraft:default"}]