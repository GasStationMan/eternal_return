## 상단 중앙 ui 보스바 내용 출력
# 입력 : pdb:main args
# 출력 없음
# 상위 함수 : function eternal_return:gui/bossbar/display/interface

## 보스바 라인별 요소
    # 부활 가능 여부(전체/개인), 게임시간 (분/초), 남은 수(팀/인원)
        $bossbar set line1.$(UUID0) name [\
            {"text":"k","font":"gui/sidebar/bg","shadow_color":0},\
            {"translate":"space.-55","font":"minecraft:default"},\
            {"nbt":"temp.kill","storage":"ui_temp","font":"gui/bossbar/kd","shadow_color":0},\
            {"translate":"space.20","font":"minecraft:default"},\
            {"nbt":"temp.death","storage":"ui_temp","font":"gui/bossbar/kd","shadow_color":0},\
            {"translate":"space.178","font":"minecraft:default"},\
            {"text":"1","font":"gui/bossbar/bg","shadow_color":0},\
        \
            {"translate":"space.-158","font":"minecraft:default"},\
            {"nbt":"temp.place","storage":"ui_temp","interpret":true,"font":"gui/bossbar/text"},\
        \
            {"translate":"space.21","font":"minecraft:default"},\
            {"score":{"name":"#timer.halfday","objective":"NUM"},"font":"gui/icon","shadow_color":0},\
            {"translate":"space.1","font":"minecraft:default"},\
            {"nbt":"temp.time_min","storage":"ui_temp","font":"gui/bossbar/timer"},\
            {"text":":","interpret":true,"font":"gui/bossbar/timer"},\
            {"nbt":"temp.time_sec","storage":"ui_temp","font":"gui/bossbar/timer"},\
        \
            {"translate":"space.27","font":"minecraft:default"},\
            {"nbt":"temp.team","storage":"ui_temp","font":"gui/bossbar/team"},\
            {"text":" ","font":"minecraft:default"},\
            {"text":"TEAM ","color":"#69A3C7","font":"gui/bossbar/text"},\
        \
            {"translate":"space.8","font":"minecraft:default"},\
            {"text":"2","font":"gui/bossbar/bg","shadow_color":0},\
        \
            {"translate":"space.-24","font":"minecraft:default"},\
            {"nbt":"temp.player","storage":"ui_temp","font":"gui/bossbar/player"},\
            {"translate":"space.213","font":"minecraft:default"}\
            ]

    # 일차
        $bossbar set line2.$(UUID0) name [\
            {"translate":"space.-9","font":"minecraft:default"},\
            {"nbt":"temp.day","storage":"ui_temp","font":"gui/bossbar/day"},\
            {"text":"일차 ","color":"white","font":"gui/bossbar/text2"},\
            {"translate":"space.-7","font":"minecraft:default"}]

    # 금지구역 남은시간
        $bossbar set line3.$(UUID0) name [\
            {"translate":"space.-3","font":"minecraft:default"},\
            {"text":"c","font":"gui/icon","shadow_color":0},\
            {"translate":"space.2","font":"minecraft:default"},\
            {"nbt":"temp.bantime","storage":"ui_temp","font":"gui/bossbar/bantime","color":"white","shadow_color":[1,0.4,0.4,1]}]