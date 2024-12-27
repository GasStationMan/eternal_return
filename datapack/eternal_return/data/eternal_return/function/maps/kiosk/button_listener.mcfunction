##버튼 추가
data modify storage minecraft:temp temp merge value {tree_of_life:"white",vf_blood:"white",random:"white",mithril:"white",meteorite:"white",force_core:"white"}

execute store result score #detect ER.sys run function df_lib:hud/rect/main {x: 614, y: 36, dx: 75, dy: 96}
execute if score #detect ER.sys matches 1 run return run function df_lib:hud/select_place/main {place:"tree_of_life",color:"blue"}

execute store result score #detect ER.sys run function df_lib:hud/rect/main {x: 468, y: 36, dx: 75, dy: 96}
execute if score #detect ER.sys matches 1 run return run function df_lib:hud/select_place/main {place:"meteorite",color:"blue"}

execute store result score #detect ER.sys run function df_lib:hud/rect/main {x: 322, y: 36, dx: 75, dy: 96}
execute if score #detect ER.sys matches 1 run return run function df_lib:hud/select_place/main {place:"mithril",color:"blue"}

execute store result score #detect ER.sys run function df_lib:hud/rect/main {x: 614, y: 141, dx: 75, dy: 96}
execute if score #detect ER.sys matches 1 run return run function df_lib:hud/select_place/main {place:"vf_blood",color:"blue"}

execute store result score #detect ER.sys run function df_lib:hud/rect/main {x: 469, y: 141, dx: 75, dy: 96}
execute if score #detect ER.sys matches 1 run return run function df_lib:hud/select_place/main {place:"force_core",color:"blue"}

execute store result score #detect ER.sys run function df_lib:hud/rect/main {x: 322, y: 141, dx: 75, dy: 96}
execute if score #detect ER.sys matches 1 run return run function df_lib:hud/select_place/main {place:"random",color:"blue"}

