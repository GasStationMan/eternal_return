item replace entity @s container.0 with carrot_on_a_stick[custom_model_data=214,item_name='{"color":"blue","text":"[ 달의 검 ]"}',lore=['{"italic":true,"text":"이름만 달의 검이지 이건 총이다."}'],attribute_modifiers=[{id:"attack_damage",type:"generic.attack_damage",amount:6,operation:"add_value"},{id:"attack_speed",type:"generic.attack_speed",amount:-2.4,operation:"add_value"}]] 1
item replace entity @s container.1 with minecraft:splash_potion[custom_model_data=214,item_name='{"color":"aqua","text":"[ 커스 ]"}',lore=['{"italic":true,"text":"상대에게 적중 시 5초간 디버프가 걸린다."}','{"italic":true,"text":"디버프에 걸린 적은 받는 탄약 데미지가 2 증가한다."}'],hide_additional_tooltip={},potion_contents={custom_color:65503,custom_effects:[{id:"minecraft:unluck",amplifier:1,duration:100,show_particles:0b,show_icon:1b,ambient:0b}]}] 1
item replace entity @s container.2 with minecraft:disc_fragment_5[custom_model_data=214,item_name='{"color":"light_purple","text":"[ 스케이프 고트 ]"}',food={nutrition:0,saturation:0,can_always_eat:true,eat_seconds:1000000}] 1
item replace entity @s container.4 with nether_star[custom_model_data=214,item_name='{"color":"dark_purple","text":"[ 데우스 엑스 마키나 ]"}',food={nutrition:0,saturation:0,can_always_eat:true,eat_seconds:1000000}] 1
item replace entity @s container.6 with soul_lantern[item_name='{"color":"aqua","text":"[ 일반 사격 ]"}'] 1
item replace entity @s container.8 with stone_button[item_name='{"color":"gray","text":"총알"}'] 6
item replace entity @s container.8 with written_book[item_name='{"color":"yellow","text":"상점"}',written_book_content={title:"",author:"",generation:0,pages:['[{"text":"          [ ","color":"black"},{"text":"상점","color":"gold"},{"text":" ]\\n"},{"text":"\\n\\n\\n\\n"},{"text":"  ▶ 빵","color":"black","clickEvent":{"action":"run_command","value":"/function command:buy_bread"}},{"text":"   "},{"text":"▶ 화살","color":"black","clickEvent":{"action":"run_command","value":"/function command:buy_arrow"}},{"text":"   "},{"text":"▶ 철검","color":"black","clickEvent":{"action":"run_command","value":"/function command:buy_sword"}},{"text":"\\n"},{"text":" ⓒ 30  ⓒ 30  ⓒ 30","color":"gold","bold":true}]']}] 1

scoreboard players set @s happybullet 6
scoreboard players set @s happyfocus 12

stopsound @a master minecraft:custom.drift
playsound minecraft:custom.drift master @s ~ ~ ~ 0.05