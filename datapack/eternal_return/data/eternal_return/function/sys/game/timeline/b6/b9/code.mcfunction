function eternal_return:sys/map/area/set_type {type:"restricted_zone"}
function eternal_return:sys/map/area/set_type {type:"scheduled_restricted_zone"}
function eternal_return:send_msg {target:"@a",text:'[{"text":"20초 후, 임시 안전지대가 활성화됩니다."}]',color:"gold",timer:1}
