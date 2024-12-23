advancement grant @a only eternal_return:alpha_30
function eternal_return:send_msg {target:"@a",text:'{"text":"알파가 [위치] 지역에 30초 후 출현합니다."}',color:"gold",timer:1}
advancement grant @a only eternal_return:battle_zone_30
function eternal_return:system/map/area/set_type {type:"scheduled_battle_zone"}
