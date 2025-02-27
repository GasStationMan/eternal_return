$bossbar set line2.$(UUID0) name [\
    {"text":"남은 시간 : ","font":"gui/centerbar/wait/remaining_text"},\
    {"nbt":"temp.remaining","storage":"ui_temp","font":"gui/centerbar/wait/remaining_num","color":"aqua"},\
    {"text":"초","font":"gui/centerbar/wait/remaining_text","color":"white"},\
    {"translate":"space.-95","font":"minecraft:default"},\
    \
    {"score":{"name":"#wait.bg","objective":"ct1"},"font":"gui/centerbar/wait/bg","shadow_color":0},\
    {"translate":"space.-75","font":"minecraft:default"},\
    {"nbt":"temp.player","storage":"ui_temp","font":"gui/centerbar/wait/count","shadow_color":0},\
    {"text":"/16","font":"gui/centerbar/wait/count","shadow_color":0},\
    {"translate":"space.10","font":"minecraft:default"}]