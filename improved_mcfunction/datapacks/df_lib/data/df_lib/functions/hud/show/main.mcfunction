$execute if entity @s[tag=$(tag)] run return run function df_lib:hud/show/b1/code {tag : "$(tag)",x:$(x),y:$(y),button_listener_function:"$(button_listener_function)",button_position_function:"$(button_position_function)"}
$execute if entity @s[tag=!$(tag), tag=choosing_$(tag)] run function df_lib:hud/show/b2/code {tag : "$(tag)"}
