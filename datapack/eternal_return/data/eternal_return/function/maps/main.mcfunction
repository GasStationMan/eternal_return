#> 하이퍼루프 함수 eternal_return:maps/hyper_loop
execute if entity @s[tag=hyper_loop] run function eternal_return:maps/hyper_loop/main
execute if entity @s[tag=!hyper_loop, tag=choosing_hyper_loop] run function eternal_return:maps/reset {tag:choosing_hyper_loop}

#> 키오스크 함수 eternal_return:maps/kiosk
execute if entity @s[tag=kiosk] run function eternal_return:maps/kiosk/main
execute if entity @s[tag=!kiosk, tag=choosing_kiosk] run function eternal_return:maps/reset {tag:choosing_kiosk}

#> 부활 선택창 함수 eternal_return:maps/resurrection
execute if entity @s[tag=resurrection] run function eternal_return:maps/resurrection/main
execute if entity @s[tag=!resurrection, tag=choosing_resurrection] run function eternal_return:maps/reset {tag:choosing_resurrection}