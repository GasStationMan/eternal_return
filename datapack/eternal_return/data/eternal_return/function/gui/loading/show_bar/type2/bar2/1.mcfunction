$title @s actionbar [ \
    {"text":"\u4100","font":"gui/loading/bar","color":"#4e5c24"}, \
    {"translate":"space.5","font":"minecraft:default"}, \
    {"text":"\u4$(score)","font":"gui/loading/bar","color":"#4e5c24"}, \
    {"interpret":true,"nbt":"players[{UUID:[I;$(UUID0),$(UUID1),$(UUID2),$(UUID3)]}].loading_text","storage":"pdb:main","color":"#4e5c24","font":"minecraft:default"}]
