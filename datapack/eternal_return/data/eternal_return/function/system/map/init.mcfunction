## 맵 초깃값 설정

function eternal_return:system/map/defualt_setting

kill @e[tag=zplace]
kill @e[tag=standing_point]


## type 값에 따른 장소 타입 지정
# safe_zone = 0
# scheduled_restricted = 1
# restricted = 2
# scheduled_battlezone = 3
# battlezone = 4



## 마커 소환
# 브리핑 룸 플레이어별 위치 표시 마커
summon marker -289 63 432 {Tags:["standing_point","s_id1"]}
summon marker -284 63 434 {Tags:["standing_point","s_id2"]}
summon marker -280 63 438 {Tags:["standing_point","s_id3"]}
summon marker -278 63 443 {Tags:["standing_point","s_id4"]}
summon marker -277 63 448 {Tags:["standing_point","s_id5"]}
summon marker -278 63 453 {Tags:["standing_point","s_id6"]}
summon marker -280 63 458 {Tags:["standing_point","s_id7"]}
summon marker -284 63 462 {Tags:["standing_point","s_id8"]}
summon marker -289 63 464 {Tags:["standing_point","s_id9"]}
summon marker -299 63 464 {Tags:["standing_point","s_id10"]}
summon marker -304 63 462 {Tags:["standing_point","s_id11"]}
summon marker -308 63 458 {Tags:["standing_point","s_id12"]}
summon marker -310 63 453 {Tags:["standing_point","s_id13"]}
summon marker -311 63 448 {Tags:["standing_point","s_id14"]}
summon marker -310 63 443 {Tags:["standing_point","s_id15"]}
summon marker -308 63 438 {Tags:["standing_point","s_id16"]}
summon marker -304 63 434 {Tags:["standing_point","s_id17"]}
summon marker -299 63 432 {Tags:["standing_point","s_id18"]}
execute as @e[tag=standing_point] at @s run tp @s ~ ~ ~ facing -294 64 448


# 구역별 마커
summon marker -573 84 526 {data:{type:0,player:0,num:1,place:alley,ui_name:"   골목길  "},Tags:["zplace","safe_area.","alley."],CustomName:'{"text":"골목길"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:2,place:archery_range,ui_name:"   양궁장  "},Tags:["zplace","safe_area.","archery_range."],CustomName:'{"text":"양궁장"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:3,place:beach,ui_name:"  모래사장 "},Tags:["zplace","safe_area.","beach."],CustomName:'{"text":"모래사장"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:4,place:cemetery,ui_name:"    묘지   "},Tags:["zplace","safe_area.","cemetery."],CustomName:'{"text":"묘지"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:5,place:chapel,ui_name:"    성당   "},Tags:["zplace","safe_area.","chapel."],CustomName:'{"text":"성당"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:6,place:dock,ui_name:"    항구   "},Tags:["zplace","safe_area.","dock."],CustomName:'{"text":"항구"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:7,place:factory,ui_name:"    공장   "},Tags:["zplace","safe_area.","factory."],CustomName:'{"text":"공장"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:8,place:fire_station,ui_name:"   소방서  "},Tags:["zplace","safe_area.","fire_station."],CustomName:'{"text":"소방서"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:9,place:forest,ui_name:"     숲    "},Tags:["zplace","safe_area.","forest."],CustomName:'{"text":"숲"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:10,place:gas_station,ui_name:"   주유소  "},Tags:["zplace","safe_area.","gas_station."],CustomName:'{"text":"주유소"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:11,place:hospital,ui_name:"    병원   "},Tags:["zplace","safe_area.","hospital."],CustomName:'{"text":"병원"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:12,place:hotel,ui_name:"    호텔   "},Tags:["zplace","safe_area.","hotel."],CustomName:'{"text":"호텔"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:13,place:police_station,ui_name:"   경찰서  "},Tags:["zplace","safe_area.","police_station."],CustomName:'{"text":"경찰서"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:14,place:pond,ui_name:"    연못   "},Tags:["zplace","safe_area.","pond."],CustomName:'{"text":"연못"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:15,place:school,ui_name:"    학교   "},Tags:["zplace","safe_area.","school."],CustomName:'{"text":"학교"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:16,place:stream,ui_name:"    개울   "},Tags:["zplace","safe_area.","stream."],CustomName:'{"text":"개울"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:17,place:temple,ui_name:"     절    "},Tags:["zplace","safe_area.","temple."],CustomName:'{"text":"절"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:18,place:uptown,ui_name:"고급 주택가"},Tags:["zplace","safe_area.","uptown."],CustomName:'{"text":"고급 주택가"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:19,place:warehouse,ui_name:"    창고   "},Tags:["zplace","safe_area.","warehouse."],CustomName:'{"text":"창고"}'}
summon marker -573 84 526 {data:{type:4,player:0,num:20,place:research_center,ui_name:"   연구소  "},Tags:["zplace","fix_area_type","restricted_zone","safe_area.","research_center."],CustomName:'{"text":"연구소"}'}
summon marker -573 84 526 {data:{type:0,player:0,num:21,place:briefing_room,ui_name:" 브리핑 룸 "},Tags:["zplace","fix_area_type","safe_area.","briefing_room."],CustomName:'{"text":"브리핑 룸"}'}