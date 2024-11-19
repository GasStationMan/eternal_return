## 맵 초깃값 설정

function eternal_return:map/set_object

## type 값에 따른 장소 타입 지정
# safe_zone = 0
# scheduled_restricted = 1
# restricted = 2
# scheduled_battlezone = 3
# battlezone = 4

## 스토리지
    # 구역별 이름 및 색
        data modify storage map list set value {\
        alley:{text:"   골목길  ",color:"white"},archery_range:{text:"   양궁장  ",color:"white"},beach:{text:"  모래사장 ",color:"white"},cemetery:{text:"    묘지   ",color:"white"},\
        chapel:{text:"    성당   ",color:"white"},dock:{text:"    항구   ",color:"white"},factory:{text:"    공장   ",color:"white"},fire_station:{text:"   소방서  ",color:"white"},\
        forest:{text:"     숲    ",color:"white"},gas_station:{text:"   주유소  ",color:"white"},hospital:{text:"    병원   ",color:"white"},hotel:{text:"    호텔   ",color:"white"},\
        police_station:{text:"   경찰서  ",color:"white"},pond:{text:"    연못   ",color:"white"},school:{text:"    학교   ",color:"white"},stream:{text:"    개울   ",color:"white"},\
        temple:{text:"     절    ",color:"white"},uptown:{text:"고급 주택가",color:"white"},warehouse:{text:"    창고   ",color:"white"},research_center:{text:"   연구소  ",color:"white"},\
        briefing_room:{text:" 브리핑 룸 ",color:"white"}}
    # 구역 TP 좌표
        data modify storage map position set value [\
        {name:alley,1:"-760 82 616",2:"-723 82 667",3:"-750 82 638"},\
        {name:archery_range,1:"-575 84 685",2:"-559 84 668",3:"-603 84 673"},\
        {name:beach,1:"-452 80 598",2:"-433 80 619",3:"-411 80 549"},\
        {name:cemetery,1:"-582 82 437",2:"-591 84 417",3:"-611 82 389"},\
        {name:chapel,1:"-537 84 447",2:"-554 82 425",3:"-561 82 394"},\
        {name:dock,1:"-464 82 352",2:"-465 82 364",3:"-488 82 354"},\
        {name:factory,1:"-609 82 329",2:"-584 82 342",3:"-542 82 358"},\
        {name:fire_station,1:"-669 82 548",2:"-684 82 590",3:"-649 82 534"},\
        {name:forest,1:"-517 82 537",2:"-540 82 498",3:"-512 82 515"},\
        {name:gas_station,1:"-678 82 628",2:"-693 82 697",3:"-657 82 698"},\
        {name:hospital,1:"-674 82 414",2:"-652 82 417",3:"-672 82 388"},\
        {name:hotel,1:"-497 80 617",2:"-517 82 639",3:"-518 80 616"},\
        {name:police_station,1:"-734 82 598",2:"-726 82 576",3:"-718 82 525"},\
        {name:pond,1:"-629 82 457",2:"-629 82 496",3:"-681 79 494"},\
        {name:school,1:"-587 86 605",2:"-613 84 604",3:"-629 82 647"},\
        {name:stream,1:"-719 79 495",2:"-720 82 444",3:"-692 82 460"},\
        {name:temple,1:"-770 82 528",2:"-777 84 505",3:"-742 82 457"},\
        {name:uptown,1:"-389 82 501",2:"-414 82 496",3:"-453 82 493"},\
        {name:warehouse,1:"-441 82 403",2:"-431 82 431",3:"-469 82 424"}]

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
        summon marker -573 84 526 {data:{place:"alley"},Tags:["zplace","safe"],CustomName:'{"text":"골목길"}'}
        summon marker -573 84 526 {data:{place:"archery_range"},Tags:["zplace","safe"],CustomName:'{"text":"양궁장"}'}
        summon marker -573 84 526 {data:{place:"beach"},Tags:["zplace","safe"],CustomName:'{"text":"모래사장"}'}
        summon marker -573 84 526 {data:{place:"cemetery"},Tags:["zplace","safe"],CustomName:'{"text":"묘지"}'}
        summon marker -573 84 526 {data:{place:"chapel"},Tags:["zplace","safe"],CustomName:'{"text":"성당"}'}
        summon marker -573 84 526 {data:{place:"dock"},Tags:["zplace","safe"],CustomName:'{"text":"항구"}'}
        summon marker -573 84 526 {data:{place:"factory"},Tags:["zplace","safe"],CustomName:'{"text":"공장"}'}
        summon marker -573 84 526 {data:{place:"fire_station"},Tags:["zplace","safe"],CustomName:'{"text":"소방서"}'}
        summon marker -573 84 526 {data:{place:"forest"},Tags:["zplace","safe"],CustomName:'{"text":"숲"}'}
        summon marker -573 84 526 {data:{place:"gas_station"},Tags:["zplace","safe"],CustomName:'{"text":"주유소"}'}
        summon marker -573 84 526 {data:{place:"hospital"},Tags:["zplace","safe"],CustomName:'{"text":"병원"}'}
        summon marker -573 84 526 {data:{place:"hotel"},Tags:["zplace","safe"],CustomName:'{"text":"호텔"}'}
        summon marker -573 84 526 {data:{place:"police_station"},Tags:["zplace","safe"],CustomName:'{"text":"경찰서"}'}
        summon marker -573 84 526 {data:{place:"pond"},Tags:["zplace","safe"],CustomName:'{"text":"연못"}'}
        summon marker -573 84 526 {data:{place:"school"},Tags:["zplace","safe"],CustomName:'{"text":"학교"}'}
        summon marker -573 84 526 {data:{place:"stream"},Tags:["zplace","safe"],CustomName:'{"text":"개울"}'}
        summon marker -573 84 526 {data:{place:"temple"},Tags:["zplace","safe"],CustomName:'{"text":"절"}'}
        summon marker -573 84 526 {data:{place:"uptown"},Tags:["zplace","safe"],CustomName:'{"text":"고급 주택가"}'}
        summon marker -573 84 526 {data:{place:"warehouse"},Tags:["zplace","safe"],CustomName:'{"text":"창고"}'}