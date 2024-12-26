$execute if entity @s[tag=$(tag)] run function df_lib:hud/show/b1/code {x:$(x),y:$(y),button_listener_function:"$(button_listener_function)",button_position_function:"$(button_position_function)"}
$execute if entity @s[tag=!$(tag), tag=choosing] run function df_lib:hud/show/b2/code
