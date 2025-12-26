



$execute if score $(scoreboardX) ER.sys matches ..-1 run \
    data modify storage minecraft:temp temp merge value {$(posX) : "000"}
$execute if score $(scoreboardX) ER.sys matches 0..9 run \
    data modify storage minecraft:temp temp merge value {$(posX) : "00$(x)"}
$execute if score $(scoreboardX) ER.sys matches 10..99 run \
    data modify storage minecraft:temp temp merge value {$(posX) : "0$(x)"}
$execute if score $(scoreboardX) ER.sys matches 100..999 run \
    data modify storage minecraft:temp temp merge value {$(posX) : "$(x)"}


$execute if score $(scoreboardY) ER.sys matches ..-1 run \
    data modify storage minecraft:temp temp merge value {$(posY) : "000"}
$execute if score $(scoreboardY) ER.sys matches 0..9 run \
    data modify storage minecraft:temp temp merge value {$(posY) : "00$(y)"}
$execute if score $(scoreboardY) ER.sys matches 10..99 run \
    data modify storage minecraft:temp temp merge value {$(posY) : "0$(y)"}
$execute if score $(scoreboardY) ER.sys matches 100..999 run \
    data modify storage minecraft:temp temp merge value {$(posY) : "$(y)"}