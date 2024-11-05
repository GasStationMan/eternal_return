



data modify storage temp temp_array set from storage pdb:main in.character_array_frame



data modify storage temp show_charlist set from storage pdb:main temp_array











execute store result score #temp.int00 NUM run data get storage temp temp_array[0][0]


function eternal_return:gui/screen/format_num











$data modify storage minecraft:temp show_charlist.line1[0] set value {\
    line1:['{"text":"\\u6$(num1)"}','{"text":"\\u$(num2)"}','{"text":"\\u6$(num3)"}','{"text":"\\u6$(num4)"}','{"text":"\\u6$(num5)"}']}
    