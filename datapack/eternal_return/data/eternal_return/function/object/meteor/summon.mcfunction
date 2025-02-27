summon marker -752 82 620 {Tags:["meteor","alley","marker"],CustomName:'"골목길"',Invulnerable:1b}
summon marker -635 82 681 {Tags:["meteor","archery_range","marker"],CustomName:'"양궁장"',Invulnerable:1b}
summon marker -472 82 541 {Tags:["meteor","beach","marker"],CustomName:'"모래사장"',Invulnerable:1b}
summon marker -518 82 411 {Tags:["meteor","chapel","marker"],CustomName:'"성당"',Invulnerable:1b}
summon marker -490 82 371 {Tags:["meteor","dock","marker"],CustomName:'"항구"',Invulnerable:1b}
summon marker -609 82 365 {Tags:["meteor","factory","marker"],CustomName:'"공장"',Invulnerable:1b}
summon marker -632 82 570 {Tags:["meteor","fire_station","marker"],CustomName:'"소방서"',Invulnerable:1b}
summon marker -662 82 668 {Tags:["meteor","gas_station","marker"],CustomName:'"주유소"',Invulnerable:1b}
summon marker -664 82 402 {Tags:["meteor","hospital","marker"],CustomName:'"병원"',Invulnerable:1b}
summon marker -735 82 564 {Tags:["meteor","police_station","marker"],CustomName:'"경찰서"',Invulnerable:1b}
summon marker -639 82 473 {Tags:["meteor","pond","marker"],CustomName:'"연못"',Invulnerable:1b}
summon marker -606 82 645 {Tags:["meteor","school","marker"],CustomName:'"학교"',Invulnerable:1b}
summon marker -423 82 460 {Tags:["meteor","uptown","marker"],CustomName:'"고급주택가"',Invulnerable:1b}
summon marker -418 82 436 {Tags:["meteor","warehouse","marker"],CustomName:'"창고"',Invulnerable:1b}

execute at @e[tag=meteor,tag=alley] run forceload add ~-5 ~-5 ~5 ~5
execute at @e[tag=meteor,tag=archery_range] run forceload add ~-5 ~-5 ~5 ~5
execute at @e[tag=meteor,tag=beach] run forceload add ~-5 ~-5 ~5 ~5
execute at @e[tag=meteor,tag=chapel] run forceload add ~-5 ~-5 ~5 ~5
execute at @e[tag=meteor,tag=dock] run forceload add ~-5 ~-5 ~5 ~5
execute at @e[tag=meteor,tag=factory] run forceload add ~-5 ~-5 ~5 ~5
execute at @e[tag=meteor,tag=fire_station] run forceload add ~-5 ~-5 ~5 ~5
execute at @e[tag=meteor,tag=gas_station] run forceload add ~-5 ~-5 ~5 ~5
execute at @e[tag=meteor,tag=hospital] run forceload add ~-5 ~-5 ~5 ~5
execute at @e[tag=meteor,tag=police_station] run forceload add ~-5 ~-5 ~5 ~5
execute at @e[tag=meteor,tag=pond] run forceload add ~-5 ~-5 ~5 ~5
execute at @e[tag=meteor,tag=school] run forceload add ~-5 ~-5 ~5 ~5
execute at @e[tag=meteor,tag=uptown] run forceload add ~-5 ~-5 ~5 ~5
execute at @e[tag=meteor,tag=warehouse] run forceload add ~-5 ~-5 ~5 ~5

tellraw @s {"text":"운석위치 마커 생성 및 청크 로딩이 완료되었습니다","color":"green"}