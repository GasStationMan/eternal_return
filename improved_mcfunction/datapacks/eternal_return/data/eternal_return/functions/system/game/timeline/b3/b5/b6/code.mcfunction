advancement grant @a only eternal_return:omega
function eternal_return:send_msg {target:"@a",text:'{"text":"오메가가 [위치]에 등장했습니다!"}',color:"gold",timer:1}
function eternal_return:system/map/area/set_type {type:"restricted_zone"}
function eternal_return:system/map/area/set_type {type:"scheduled_restricted_zone"}
