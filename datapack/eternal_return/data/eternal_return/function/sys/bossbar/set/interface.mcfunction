$bossbar set line1.id$(id) name [\
    {"score":{"name":"#game.respawn","objective":"CT1"},"font":"boss/respawn","color":"#4e5c24"},\
    {"translate":"space.-30","font":"minecraft:default"},\
    {"score":{"name":"@s","objective":"ER.resurrection"},"font":"boss/resurrection","color":"#4e5c24"},\
    {"translate":"space.3","font":"minecraft:default"},\
    {"text":"2","font":"boss/icon","color":"#4e5c24"},\
\
    {"translate":"space.-158","font":"minecraft:default"},\
    {"nbt":"players[{id:$(id)}].place_text","storage":"minecraft:player_data","font":"boss/text","interpret":true},\
\
    {"translate":"space.21","font":"minecraft:default"},\
    {"score":{"name":"#timer.halfday","objective":"CT1"},"font":"boss/halfday","color":"#4e5c24"},\
    {"translate":"space.1","font":"minecraft:default"},\
    {"text":"0","font":"boss/timer"},\
    {"score":{"name":"#timer.min","objective":"CT1"},"font":"boss/timer"},\
    {"text":":","font":"boss/timer"},\
    {"nbt":"timer_char","storage":"text","interpret":true,"font":"boss/timer"},\
\
    {"translate":"space.27","font":"minecraft:default"},\
    {"nbt":"team_char","storage":"text","interpret":true,"font":"boss/team"},\
    {"text":" ","font":"minecraft:default"},\
    {"text":"TEAM ","color":"#69A3C7","font":"boss/text"},\
\
    {"translate":"space.7","font":"minecraft:default"},\
    {"text":"1","font":"boss/icon","color":"#4e5c24"},\
\
    {"translate":"space.-24","font":"minecraft:default"},\
    {"nbt":"player_char","storage":"text","interpret":true,"font":"boss/player"},\
    {"translate":"space.17","font":"minecraft:default"}\
    ]

$bossbar set line2.id$(id) name [\
    {"translate":"space.-7","font":"minecraft:default"},\
    {"nbt":"day_char","storage":"text","interpret":true,"font":"boss/day"},\
    {"text":"일차","color":"white","font":"boss/text2"},\
    {"translate":"space.-19","font":"minecraft:default"},\
\
    {"text":"0","font":"boss/icon","color":"#4e5c24"},\
    {"nbt":"bantime_char","storage":"text","interpret":true,"font":"boss/bantime","color":"red"},\
    {"translate":"space.-6","font":"minecraft:default"}\
    ]