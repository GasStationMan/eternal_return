## 상단 중앙 ui 보스바 내용 출력
# 입력 : pdb:main args
# 출력 없음
# 상위 함수 : function eternal_return:gui/bossbar/display/interface

## 보스바 라인별 요소
    # 부활 가능 여부(전체/개인), 게임시간 (분/초), 남은 수(팀/인원)
        $bossbar set line1.$(UUID0) name [\
            {"text":"k","font":"gui/character/bg","shadow_color":0},\
            {"translate":"space.-55","font":"minecraft:default"},\
            {"nbt":"temp.kill","storage":"ui_temp","font":"gui/bossbar/kd","shadow_color":0},\
            {"translate":"space.20","font":"minecraft:default"},\
            {"nbt":"temp.death","storage":"ui_temp","font":"gui/bossbar/kd","shadow_color":0},\
        \
            {"translate":"space.9","font":"minecraft:default"},\
            {"text":"1","font":"gui/character/bg"},{"translate":"space.4","font":"minecraft:default"},\
            {"score":{"name":"@s","objective":"skill_exp_image"},"font":"gui/character/exp"},{"translate":"space.-12","font":"minecraft:default"},\
            {"nbt":"temp.profile","storage":"ui_temp","interpret":true,"font":"gui/character/profile"},{"translate":"space.-56","font":"minecraft:default"},\
            {"text":"b","font":"gui/character/bg"},{"translate":"space.-1","font":"minecraft:default"},\
            {"text":"s","font":"gui/character/bg"},{"translate":"space.-48","font":"minecraft:default"},\
            {"score":{"name":"@s","objective":"active_level"},"font":"gui/character/active_level"},{"translate":"space.-20","font":"minecraft:default"},{"nbt":"temp.profile","storage":"ui_temp","interpret":true,"font":"gui/character/active"},{"translate":"space.-19","font":"minecraft:default"},{"nbt":"in.character.active_cool_image","storage":"pdb:main","font":"gui/character/active"},{"translate":"space.2","font":"minecraft:default"},\
            {"score":{"name":"@s","objective":"passive_level"},"font":"gui/character/passive_level"},{"translate":"space.-18","font":"minecraft:default"},{"nbt":"temp.profile","storage":"ui_temp","interpret":true,"font":"gui/character/passive"},{"translate":"space.-17","font":"minecraft:default"},{"nbt":"in.character.passive_cool_image","storage":"pdb:main","font":"gui/character/passive"},{"translate":"space.2","font":"minecraft:default"},\
            {"translate":"space.-43","font":"minecraft:default"},\
            {"text":"c","font":"gui/character/bg"},{"translate":"space.15","font":"minecraft:default"},\
        \
            {"text":"2","font":"gui/character/bg"},{"translate":"space.-1","font":"minecraft:default"},{"text":"3","font":"gui/character/bg"},{"translate":"space.-1","font":"minecraft:default"},{"text":"4","font":"gui/character/bg"},\
        \
            {"nbt":"temp.atk","storage":"ui_temp","interpret":true},{"translate":"space.-4","font":"minecraft:default"},\
            {"nbt":"temp.atk_spd","storage":"ui_temp","interpret":true},{"translate":"space.-15","font":"minecraft:default"},\
            {"nbt":"temp.armor","storage":"ui_temp","interpret":true},{"translate":"space.-7","font":"minecraft:default"},\
            {"nbt":"temp.armor_tou","storage":"ui_temp","interpret":true},{"translate":"space.-7","font":"minecraft:default"},\
            {"nbt":"temp.level","storage":"ui_temp","interpret":true},{"translate":"space.78","font":"minecraft:default"},\
            {"nbt":"temp.credit","storage":"ui_temp","interpret":true,"shadow_color":[0,0,0,1]},{"translate":"space.-98","font":"minecraft:default"},\
            {"nbt":"temp.active_cool","storage":"ui_temp","interpret":true,"shadow_color":[0,0,0,0.8]},{"translate":"space.-8","font":"minecraft:default"},\
            {"nbt":"temp.passive_cool","storage":"ui_temp","interpret":true,"shadow_color":[0,0,0,0.8]},{"translate":"space.-7","font":"minecraft:default"},\
        \
            {"translate":"space.-181","font":"minecraft:default"},\
            {"text":"1","font":"gui/bossbar/bg","shadow_color":0},\
        \
            {"translate":"space.-158","font":"minecraft:default"},\
            {"nbt":"temp.place","storage":"ui_temp","interpret":true,"font":"gui/bossbar/text"},\
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
        \
            {"translate":"space.-9","font":"minecraft:default"},\
            {"nbt":"temp.day","storage":"ui_temp","font":"gui/bossbar/day"},\
            {"text":"일차 ","color":"white","font":"gui/bossbar/text2"},\
            {"translate":"space.-7","font":"minecraft:default"},\
        \
            {"translate":"space.-3","font":"minecraft:default"},\
            {"translate":"space.-115","font":"minecraft:default"},\
            {"text":"c","font":"gui/icon","shadow_color":0},\
            {"nbt":"temp.bantime","storage":"ui_temp","font":"gui/bossbar/bantime","color":"white","shadow_color":[1,0.4,0.4,1]},\
            {"translate":"space.313","font":"minecraft:default"}\
        ]