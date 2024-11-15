## 맵 초깃값 설정

function eternal_return:map/set_object

## type 값에 따른 장소 타입 지정
# safe_zone = 0
# scheduled_restricted = 1
# restricted = 2
# scheduled_battlezone = 3
# battlezone = 4

## 마커 소환
    # 마커 제거
        kill @e[tag=zplace]
        kill @e[tag=standing_point]

    # 브리핑 룸 플레이어별 위치 표시 마커
        summon interaction -246 63 484 {width:1f,height:2f,Tags:["standing_point","s_id1"]}
        summon interaction -246 63 482 {width:1f,height:2f,Tags:["standing_point","s_id2"]}
        summon interaction -246 63 480 {width:1f,height:2f,Tags:["standing_point","s_id3"]}
        summon interaction -246 63 478 {width:1f,height:2f,Tags:["standing_point","s_id4"]}
        summon interaction -246 63 476 {width:1f,height:2f,Tags:["standing_point","s_id5"]}
        summon interaction -246 63 474 {width:1f,height:2f,Tags:["standing_point","s_id6"]}
        summon interaction -246 63 472 {width:1f,height:2f,Tags:["standing_point","s_id7"]}
        summon interaction -246 63 470 {width:1f,height:2f,Tags:["standing_point","s_id8"]}
        summon interaction -246 63 468 {width:1f,height:2f,Tags:["standing_point","s_id9"]}
        summon interaction -244 63 484 {width:1f,height:2f,Tags:["standing_point","s_id10"]}
        summon interaction -244 63 482 {width:1f,height:2f,Tags:["standing_point","s_id11"]}
        summon interaction -244 63 480 {width:1f,height:2f,Tags:["standing_point","s_id12"]}
        summon interaction -244 63 478 {width:1f,height:2f,Tags:["standing_point","s_id13"]}
        summon interaction -244 63 476 {width:1f,height:2f,Tags:["standing_point","s_id14"]}
        summon interaction -244 63 474 {width:1f,height:2f,Tags:["standing_point","s_id15"]}
        summon interaction -244 63 472 {width:1f,height:2f,Tags:["standing_point","s_id16"]}
        summon interaction -244 63 470 {width:1f,height:2f,Tags:["standing_point","s_id17"]}
        summon interaction -244 63 468 {width:1f,height:2f,Tags:["standing_point","s_id18"]}

    # 구역별 마커
        summon marker -573 84 526 {data:{type:0,player:0,num:1},Tags:["zplace","safe_area.","alley."],CustomName:'{"text":"골목길"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:2},Tags:["zplace","safe_area.","archery_range."],CustomName:'{"text":"양궁장"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:3},Tags:["zplace","safe_area.","beach."],CustomName:'{"text":"모래사장"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:4},Tags:["zplace","safe_area.","cemetery."],CustomName:'{"text":"묘지"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:5},Tags:["zplace","safe_area.","chapel."],CustomName:'{"text":"성당"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:6},Tags:["zplace","safe_area.","dock."],CustomName:'{"text":"항구"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:7},Tags:["zplace","safe_area.","factory."],CustomName:'{"text":"공장"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:8},Tags:["zplace","safe_area.","fire_station."],CustomName:'{"text":"소방서"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:9},Tags:["zplace","safe_area.","forest."],CustomName:'{"text":"숲"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:10},Tags:["zplace","safe_area.","gas_station."],CustomName:'{"text":"주유소"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:11},Tags:["zplace","safe_area.","hospital."],CustomName:'{"text":"병원"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:12},Tags:["zplace","safe_area.","hotel."],CustomName:'{"text":"호텔"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:13},Tags:["zplace","safe_area.","police_station."],CustomName:'{"text":"경찰서"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:14},Tags:["zplace","safe_area.","pond."],CustomName:'{"text":"연못"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:15},Tags:["zplace","safe_area.","school."],CustomName:'{"text":"학교"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:16},Tags:["zplace","safe_area.","stream."],CustomName:'{"text":"개울"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:17},Tags:["zplace","safe_area.","temple."],CustomName:'{"text":"절"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:18},Tags:["zplace","safe_area.","uptown."],CustomName:'{"text":"고급 주택가"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:19},Tags:["zplace","safe_area.","warehouse."],CustomName:'{"text":"창고"}'}
        summon marker -573 84 526 {data:{type:4,player:0,num:20},Tags:["zplace","fix_area_type","restricted_zone","safe_area.","research_center."],CustomName:'{"text":"연구소"}'}
        summon marker -573 84 526 {data:{type:0,player:0,num:21},Tags:["zplace","fix_area_type","safe_area.","briefing_room."],CustomName:'{"text":"브리핑 룸"}'}