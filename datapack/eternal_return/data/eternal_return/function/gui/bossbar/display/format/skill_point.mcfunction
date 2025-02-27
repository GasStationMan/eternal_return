## 스킬포인트 표기
# 상위 함수 : function eternal_return:gui/bossbar/display/interface


# 스킬 포인트 텍스트
execute if score @s skill_point matches 1..9 run \
    data modify storage ui_temp temp.skill_point_text set value [{"text":"스킬 강화 포인트 +","font":"gui/character/text/skill_point","color":"yellow"},{"score":{"objective":"skill_point","name":"@s"},"font":"gui/character/text/skill_point_mono"},{"text":" "}]
execute if score @s skill_point matches 10.. run \
    data modify storage ui_temp temp.skill_point_text set value [{"text":"스킬 강화 포인트 +","font":"gui/character/text/skill_point","color":"yellow"},{"score":{"objective":"skill_point","name":"@s"},"font":"gui/character/text/skill_point_mono"},{"translate":"space.-2","font":"minecraft:default"}]
execute if score @s skill_point matches 0 run \
    data modify storage ui_temp temp.skill_point_text set value [{"translate":"space.52","font":"minecraft:default"}]


# 액티브
execute if score @s skill_point matches 0 run \
    data modify storage ui_temp temp.askill_point set value [{"text":"e","font":"gui/character/bg"}]

execute if score @s active_level matches ..4 if score @s skill_point matches 1.. run \
    data modify storage ui_temp temp.askill_point set value [{"text":"o","font":"gui/character/bg"}]

execute if score @s active_level matches 5 if score @s passive_level matches ..4 if score @s skill_point matches 1.. run \
    data modify storage ui_temp temp.askill_point set value [{"text":"f","font":"gui/character/bg"}]

# 패시브
execute if score @s skill_point matches 0 run \
    data modify storage ui_temp temp.pskill_point set value [{"text":"e","font":"gui/character/bg"}]

execute if score @s passive_level matches ..4 if score @s skill_point matches 1.. run \
    data modify storage ui_temp temp.pskill_point set value [{"text":"o","font":"gui/character/bg"}]

execute if score @s passive_level matches 5 if score @s active_level matches ..4 if score @s skill_point matches 1.. run \
    data modify storage ui_temp temp.pskill_point set value [{"text":"f","font":"gui/character/bg"}]