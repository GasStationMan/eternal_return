## 영웅 상자 소환
# 입출력 없음
# 상위 함수 : function eternal_return:object/box/summon_tick

summon item_display ~ ~ ~ {CustomNameVisible:0b,item_display:"head",Tags:["epic_box"],item:{id:"minecraft:creeper_banner_pattern",count:1,components:{"minecraft:custom_model_data":{strings:["epic_box"]}}}}
setblock ~ ~ ~ chest{LootTable:"eternal_return:chests/epic_box",CustomName:'"영웅상자"'} replace