$bossbar set line1.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [\
    {"score":{"name":"#game.respawn","objective":"CT1"},"font":"boss/respawn","color":"#4e5c24"},\
    {"translate":"space.-30","font":"minecraft:default"},\
    {"score":{"name":"@s","objective":"resurrection"},"font":"boss/resurrection","color":"#4e5c24"},\
    {"translate":"space.3","font":"minecraft:default"},\
    {"text":"2","font":"boss/icon","color":"#4e5c24"},\
\
    {"translate":"space.-158","font":"minecraft:default"},\
    {"nbt":"in.place_name","storage":"pdb:main","font":"boss/text"},\
\
    {"translate":"space.21","font":"minecraft:default"},\
    {"score":{"name":"#timer.halfday","objective":"CT1"},"font":"boss/halfday","color":"#4e5c24"},\
    {"translate":"space.1","font":"minecraft:default"},\
    {"text":"0","font":"boss/timer"},\
    {"score":{"name":"#timer.min","objective":"CT1"},"font":"boss/timer"},\
    {"text":":","interpret":true,"font":"boss/timer"},\
    {"text":"00","font":"boss/timer"},\
\
    {"translate":"space.27","font":"minecraft:default"},\
    {"text":"10","font":"boss/team"},\
    {"text":" ","font":"minecraft:default"},\
    {"text":"TEAM ","color":"#69A3C7","font":"boss/text"},\
\
    {"translate":"space.7","font":"minecraft:default"},\
    {"text":"1","font":"boss/icon","color":"#4e5c24"},\
\
    {"translate":"space.-24","font":"minecraft:default"},\
    {"text":"10","font":"boss/player"},\
    {"translate":"space.17","font":"minecraft:default"}\
    ]

$bossbar set line2.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [\
    {"translate":"space.-7","font":"minecraft:default"},\
    {"text":" 0","font":"boss/day"},\
    {"text":"일차 ","color":"white","font":"boss/text2"},\
    {"translate":"space.-7","font":"minecraft:default"}]

$bossbar set line3.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [\
    {"text":"0","font":"boss/icon","color":"#4e5c24"},\
    {"translate":"space.2","font":"minecraft:default"},\
    {"text":"20","font":"boss/bantime","color":"red"},\
    {"translate":"space.0","font":"minecraft:default"}\
    ]