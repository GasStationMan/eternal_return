#tree_of_life:"white",vf_blood:"white",random:"white",mithril:"white",meteorite:"white",force_core:"white"

$bossbar set minecraft:line5.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [\
    {"translate":"space.40",     "font":"minecraft:default"},\
    {"font":"minecraft:map/kiosk", "text":"\u4000"},\
    \
    {"translate":"space.-400",     "font":"minecraft:default"},\
    {"translate":"space.-115",     "font":"minecraft:default"},\
    {"font":"minecraft:map/kiosk", "text":"\u4001"},\
    {"translate":"space.400",      "font":"minecraft:default"},\
    \
    {"translate":"space.-550",     "font":"minecraft:default"},\
    {"translate":"space.-80",     "font":"minecraft:default"},\
    {"font":"minecraft:map/kiosk", "text":"\u4002","color":"$(tree_of_life)"},\
    {"translate":"space.550",      "font":"minecraft:default"},\
    \
    {"translate":"space.-400",     "font":"minecraft:default"},\
    {"translate":"space.-80",     "font":"minecraft:default"},\
    {"font":"minecraft:map/kiosk", "text":"\u4003","color":"$(meteorite)"},\
    {"translate":"space.400",      "font":"minecraft:default"},\
    \
    {"translate":"space.-250",     "font":"minecraft:default"},\
    {"translate":"space.-80",     "font":"minecraft:default"},\
    {"font":"minecraft:map/kiosk", "text":"\u4004","color":"$(mithril)"},\
    {"translate":"space.250",      "font":"minecraft:default"},\
    \
    {"translate":"space.12",     "font":"minecraft:default"},\
    \
    {"translate":"space.-550",     "font":"minecraft:default"},\
    {"translate":"space.-80",     "font":"minecraft:default"},\
    {"font":"minecraft:map/kiosk", "text":"\u4005","color":"$(vf_blood)"},\
    {"translate":"space.550",      "font":"minecraft:default"},\
    \
    {"translate":"space.-400",     "font":"minecraft:default"},\
    {"translate":"space.-80",     "font":"minecraft:default"},\
    {"font":"minecraft:map/kiosk", "text":"\u4006","color":"$(force_core)"},\
    {"translate":"space.400",      "font":"minecraft:default"},\
    \
    {"translate":"space.-250",     "font":"minecraft:default"},\
    {"translate":"space.-80",     "font":"minecraft:default"},\
    {"font":"minecraft:map/kiosk", "text":"\u4007","color":"$(random)"},\
    {"translate":"space.250",      "font":"minecraft:default"},\
    \
    {"translate":"space.-$(x)",    "font":"minecraft:default"},\
    {"translate":"space.-7",       "font":"minecraft:default"},\
    {"font":"minecraft:map/icon",  "text":"\u1$(mouseY)"},\
    {"translate":"space.$(x)",     "font":"minecraft:default"}\
    ]