advancement grant @a only eternal_return:alpha
function eternal_return:send_msg {target:"@a",text:'{"text":"알파가 [위치]에 등장했습니다!"}',color:"gold",timer:1}
advancement grant @a only eternal_return:battle_zone
function eternal_return:map/area/set_type {type:"battle_zone"}
