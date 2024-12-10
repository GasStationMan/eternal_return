## 핫바 슬롯 아이템 채우기
# 상위 함수 : function eternal_return:gui/screen/tick
# 모든 핫바 슬롯과 반대 손 슬롯을 클릭 아이템을 변경

    item replace entity @s weapon.offhand with air
    item replace entity @s hotbar.0 with warped_fungus_on_a_stick[custom_model_data={strings:["empty"]},custom_name='""',custom_data={tag:"selectmod"}] 1
    item replace entity @s hotbar.1 with warped_fungus_on_a_stick[custom_model_data={strings:["empty"]},custom_name='""',custom_data={tag:"selectmod"}] 1
    item replace entity @s hotbar.2 with warped_fungus_on_a_stick[custom_model_data={strings:["empty"]},custom_name='""',custom_data={tag:"selectmod"}] 1
    item replace entity @s hotbar.3 with warped_fungus_on_a_stick[custom_model_data={strings:["empty"]},custom_name='""',custom_data={tag:"selectmod"}] 1
    item replace entity @s hotbar.4 with warped_fungus_on_a_stick[custom_model_data={strings:["empty"]},custom_name='""',custom_data={tag:"selectmod"}] 1
    item replace entity @s hotbar.5 with warped_fungus_on_a_stick[custom_model_data={strings:["empty"]},custom_name='""',custom_data={tag:"selectmod"}] 1
    item replace entity @s hotbar.6 with warped_fungus_on_a_stick[custom_model_data={strings:["empty"]},custom_name='""',custom_data={tag:"selectmod"}] 1
    item replace entity @s hotbar.7 with warped_fungus_on_a_stick[custom_model_data={strings:["empty"]},custom_name='""',custom_data={tag:"selectmod"}] 1
    item replace entity @s hotbar.8 with warped_fungus_on_a_stick[custom_model_data={strings:["empty"]},custom_name='""',custom_data={tag:"selectmod"}] 1

# 태그 부여
tag @s add has_blankItem