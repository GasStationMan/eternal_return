$title @s actionbar [ \
    {"text":"\u400$(score)","font":"gui/loading/bar","shadow_color":0}, \
    {"translate":"space.5","font":"minecraft:default"}, \
    {"text":"\u4000","font":"gui/loading/bar","shadow_color":0}, \
    {"interpret":true,"nbt":"players[{UUID:[I;$(UUID0),$(UUID1),$(UUID2),$(UUID3)]}].loading_text","storage":"pdb:main","shadow_color":0,"font":"minecraft:default"}]