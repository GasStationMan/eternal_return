$bossbar set line5.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [\
    {"text":"남은 시간 : ","font":"gui/centerbar/wait/remaining_text"},\
    {"score":{"name":"#wait.remaining","objective":"CT1"},"font":"gui/centerbar/wait/remaining_num","color":"aqua"},\
    {"text":"초","font":"gui/centerbar/wait/remaining_text","color":"white"}]

$bossbar set line4.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [\
    {"score":{"name":"#wait.bg","objective":"CT1"},"font":"gui/centerbar/wait/bg","color":"#4e5c24"},\
    {"translate":"space.-75","font":"minecraft:default"},\
    {"nbt":"temp.player","storage":"ui_temp","font":"gui/centerbar/wait/count","color":"#4e5c24"},\
    {"text":"/18","font":"gui/centerbar/wait/count","color":"#4e5c24"},\
    {"translate":"space.51","font":"minecraft:default"}]