##버튼 추가
data modify storage minecraft:temp temp merge value {beach:"white",hotel:"white",archery_range:"white",gas_station:"white",school:"white",fire:"white",alley:"white",police:"white",temple:"white",lab:"white",forest:"white",cemetery:"white",pond:"white",stream:"white",hospital:"white",factory:"white",chapel:"white",port:"white",village:"white",storage:"white"}
#> 모래사장
execute if function eternal_return:maps/hyperloop/cursor_in_place/beach run return run function df_lib:hud/select_place/main {place:"beach",color:"blue"}

#> 주유소
execute if function eternal_return:maps/hyperloop/cursor_in_place/gas_station run return run function df_lib:hud/select_place/main {place:"gas_station",color:"blue"}

#> 골목
execute if function eternal_return:maps/hyperloop/cursor_in_place/alley run return run function df_lib:hud/select_place/main {place:"alley",color:"blue"}

#> 양궁장
execute if function eternal_return:maps/hyperloop/cursor_in_place/archery_range run return run function df_lib:hud/select_place/main {place:"archery_range",color:"blue"}

#> 학교
execute if function eternal_return:maps/hyperloop/cursor_in_place/school run return run function df_lib:hud/select_place/main {place:"school",color:"blue"}

#> 호텔
execute if function eternal_return:maps/hyperloop/cursor_in_place/hotel run return run function df_lib:hud/select_place/main {place:"hotel",color:"blue"}

#> 소방서
execute if function eternal_return:maps/hyperloop/cursor_in_place/fire run return run function df_lib:hud/select_place/main {place:"fire",color:"blue"}

#> 경찰서
execute if function eternal_return:maps/hyperloop/cursor_in_place/police run return run function df_lib:hud/select_place/main {place:"police",color:"blue"}

#> 절
execute if function eternal_return:maps/hyperloop/cursor_in_place/temple run return run function df_lib:hud/select_place/main {place:"temple",color:"blue"}

#> 숲
execute if function eternal_return:maps/hyperloop/cursor_in_place/forest run return run function df_lib:hud/select_place/main {place:"forest",color:"blue"}

#> 연못
execute if function eternal_return:maps/hyperloop/cursor_in_place/pond run return run function df_lib:hud/select_place/main {place:"pond",color:"blue"}

#> 개울
execute if function eternal_return:maps/hyperloop/cursor_in_place/stream run return run function df_lib:hud/select_place/main {place:"stream",color:"blue"}

#> 묘지
execute if function eternal_return:maps/hyperloop/cursor_in_place/cemetery run return run function df_lib:hud/select_place/main {place:"cemetery",color:"blue"}

#> 병원
execute if function eternal_return:maps/hyperloop/cursor_in_place/hospital run return run function df_lib:hud/select_place/main {place:"hospital",color:"blue"}

#> 고급 주택가
execute if function eternal_return:maps/hyperloop/cursor_in_place/village run return run function df_lib:hud/select_place/main {place:"village",color:"blue"}

#> 성당
execute if function eternal_return:maps/hyperloop/cursor_in_place/chapel run return run function df_lib:hud/select_place/main {place:"chapel",color:"blue"}

#> 창고
execute if function eternal_return:maps/hyperloop/cursor_in_place/storage run return run function df_lib:hud/select_place/main {place:"storage",color:"blue"}

#> 항구
execute if function eternal_return:maps/hyperloop/cursor_in_place/port run return run function df_lib:hud/select_place/main {place:"port",color:"blue"}

#> 공장
execute if function eternal_return:maps/hyperloop/cursor_in_place/factory run return run function df_lib:hud/select_place/main {place:"factory",color:"blue"}
