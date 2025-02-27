## 스킬 업데이트 업데이트
# 상위 함수 : function eternal_return:game/player/in_game/start_item
# 입력 : pdb:main in.character

# 액티브
$item replace entity @s container.10 with flower_banner_pattern[\
    minecraft:custom_model_data={floats:[$(no)],strings:["active"]},\
    custom_name='[{"italic":false,"text":"$(aname)"},{"color":"gold","italic":false,"text":" Lv.$(alevel)"}]',lore=['{"color":"gray","italic":false,"text":"$(alore1)"}','{"color":"gray","italic":false,"text":"$(alore2)"}','{"color":"gray","italic":false,"text":"$(alore3)"}','[{"color":"aqua","italic":false,"text":"쿨타임 : "},{"color":"white","italic":false,"text":"$(acool)"},{"color":"white","italic":false,"text":"s"}]','""','{"color":"dark_gray","italic":false,"text":"클릭 시 레벨 업"}']]

# 패시브
$item replace entity @s container.11 with flower_banner_pattern[\
    minecraft:custom_model_data={floats:[$(no)],strings:["passive"]},\
    custom_name='[{"italic":false,"text":"$(pname)"},{"color":"gold","italic":false,"text":" Lv.$(plevel)"}]',lore=['{"color":"gray","italic":false,"text":"$(plore1)"}','{"color":"gray","italic":false,"text":"$(plore2)"}','{"color":"gray","italic":false,"text":"$(plore3)"}','[{"color":"aqua","italic":false,"text":"쿨타임 : "},{"color":"white","italic":false,"text":"$(pcool)"},{"color":"white","italic":false,"text":"s"}]','""','{"color":"dark_gray","italic":false,"text":"클릭 시 레벨 업"}']]