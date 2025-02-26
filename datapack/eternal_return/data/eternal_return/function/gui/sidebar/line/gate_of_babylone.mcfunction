## 사이드바 생성
# 상위함수 : 없음
# 입력 : @s pdb:main args


# 
$scoreboard players display name line0 sidebar.$(UUID0) [ \
    {"text":"1","font":"gui/character/bg"},{"translate":"space.9","font":"minecraft:default"},\
    {"text":"h","font":"gui/character/bg"},{"translate":"space.-56","font":"minecraft:default"},\
    {"text":"b","font":"gui/character/bg"},{"translate":"space.-1","font":"minecraft:default"},\
    {"text":"s","font":"gui/character/bg"},{"translate":"space.-48","font":"minecraft:default"},\
    {"text":"a","font":"gui/character/skill"},{"text":"p","font":"gui/character/skill"},{"translate":"space.-41","font":"minecraft:default"},\
    {"text":"c","font":"gui/character/bg"},{"translate":"space.16","font":"minecraft:default"},\
    {"text":"2","font":"gui/character/bg"},{"translate":"space.-1","font":"minecraft:default"},{"text":"3","font":"gui/character/bg"},{"translate":"space.-1","font":"minecraft:default"},{"text":"4","font":"gui/character/bg"},{"translate":"space.16","font":"minecraft:default"},\
    {"translate":"space.212","font":"minecraft:default"}]
$scoreboard players display name line1 sidebar.$(UUID0) ""
$scoreboard players display name line2 sidebar.$(UUID0) ""
$scoreboard players display name line3 sidebar.$(UUID0) ""
$scoreboard players display name line4 sidebar.$(UUID0) ""
$scoreboard players display name line5 sidebar.$(UUID0) ""
$scoreboard players display name line6 sidebar.$(UUID0) ""
$scoreboard players display name line7 sidebar.$(UUID0) ""
$scoreboard players display name line8 sidebar.$(UUID0) [{"score":{"name":"@s","objective":"level"},"translate":"space.45","font":"minecraft:default"},{"text":"20","font":"gui/character/text/level"}]
$scoreboard players display name line9 sidebar.$(UUID0) ""