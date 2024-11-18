## 상단 중앙 ui 보스바 내용 출력
# 입력 : pdb:main args
# 출력 없음
# 상위 함수 : function eternal_return:gui/bossbar/display/interface

## 보스바 라인별 요소
    # 부활 가능 여부(전체/개인), 게임시간 (분/초), 남은 수(팀/인원)
        $bossbar set line1.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [\
            {"score":{"name":"#game.respawn","objective":"CT1"},"font":"boss/respawn","color":"#4e5c24"},\
            {"translate":"space.-30","font":"minecraft:default"},\
            {"score":{"name":"@s","objective":"resurrection"},"font":"boss/resurrection","color":"#4e5c24"},\
            {"translate":"space.4","font":"minecraft:default"},\
            {"text":"2","font":"boss/icon","color":"#4e5c24"},\
        \
            {"translate":"space.-158","font":"minecraft:default"},\
            {"nbt":"temp.place","storage":"ui_temp","interpret":true,"font":"boss/text"},\
        \
            {"translate":"space.21","font":"minecraft:default"},\
            {"score":{"name":"#timer.halfday","objective":"CT1"},"font":"boss/halfday","color":"#4e5c24"},\
            {"translate":"space.1","font":"minecraft:default"},\
            {"nbt":"temp.time_min","storage":"ui_temp","font":"boss/timer"},\
            {"text":":","interpret":true,"font":"boss/timer"},\
            {"nbt":"temp.time_sec","storage":"ui_temp","font":"boss/timer"},\
        \
            {"translate":"space.27","font":"minecraft:default"},\
            {"nbt":"temp.team","storage":"ui_temp","font":"boss/team"},\
            {"text":" ","font":"minecraft:default"},\
            {"text":"TEAM ","color":"#69A3C7","font":"boss/text"},\
        \
            {"translate":"space.8","font":"minecraft:default"},\
            {"text":"1","font":"boss/icon","color":"#4e5c24"},\
        \
            {"translate":"space.-24","font":"minecraft:default"},\
            {"nbt":"temp.player","storage":"ui_temp","font":"boss/player"},\
            {"translate":"space.17","font":"minecraft:default"}\
            ]

    # 일차
        $bossbar set line2.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [\
            {"translate":"space.-9","font":"minecraft:default"},\
            {"nbt":"temp.day","storage":"ui_temp","font":"boss/day"},\
            {"text":"일차 ","color":"white","font":"boss/text2"},\
            {"translate":"space.-7","font":"minecraft:default"}]

    # 금지구역 남은시간
        $bossbar set line3.$(UUID0).$(UUID1).$(UUID2).$(UUID3) name [\
            {"translate":"space.-3","font":"minecraft:default"},\
            {"text":"0","font":"boss/icon","color":"#4e5c24"},\
            {"translate":"space.2","font":"minecraft:default"},\
            {"nbt":"temp.bantime","storage":"ui_temp","font":"boss/bantime","color":"red"}]