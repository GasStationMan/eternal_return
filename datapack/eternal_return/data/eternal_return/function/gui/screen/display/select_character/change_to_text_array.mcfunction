## 배열의 정수값을 텍스트 형식으로 변환
# 상위 함수 : function eternal_return:gui/screen/display/select_character
# 플레이어의 캐릭터 선택 프레임 베열(3줄)을 가져오고 각 인덱스의 정수값을 텍스트 형식으로 변환한다

data modify storage minecraft:temp show_charlist set value [[],[],[]]

data modify storage temp temp_array set from storage pdb:main in.character_array_frame

data modify storage temp int set from storage temp temp_array[0][0]
function eternal_return:gui/screen/format_num with storage temp
data modify storage temp show_charlist[0] append from storage temp intTotext

data modify storage temp int set from storage temp temp_array[0][1]
function eternal_return:gui/screen/format_num with storage temp
data modify storage temp show_charlist[0] append from storage temp intTotext

data modify storage temp int set from storage temp temp_array[0][2]
function eternal_return:gui/screen/format_num with storage temp
data modify storage temp show_charlist[0] append from storage temp intTotext

data modify storage temp int set from storage temp temp_array[0][3]
function eternal_return:gui/screen/format_num with storage temp
data modify storage temp show_charlist[0] append from storage temp intTotext

data modify storage temp int set from storage temp temp_array[0][4]
function eternal_return:gui/screen/format_num with storage temp
data modify storage temp show_charlist[0] append from storage temp intTotext


data modify storage temp int set from storage temp temp_array[1][0]
function eternal_return:gui/screen/format_num with storage temp
data modify storage temp show_charlist[1] append from storage temp intTotext

data modify storage temp int set from storage temp temp_array[1][1]
function eternal_return:gui/screen/format_num with storage temp
data modify storage temp show_charlist[1] append from storage temp intTotext

data modify storage temp int set from storage temp temp_array[1][2]
function eternal_return:gui/screen/format_num with storage temp
data modify storage temp show_charlist[1] append from storage temp intTotext

data modify storage temp int set from storage temp temp_array[1][3]
function eternal_return:gui/screen/format_num with storage temp
data modify storage temp show_charlist[1] append from storage temp intTotext

data modify storage temp int set from storage temp temp_array[1][4]
function eternal_return:gui/screen/format_num with storage temp
data modify storage temp show_charlist[1] append from storage temp intTotext


data modify storage temp int set from storage temp temp_array[2][0]
function eternal_return:gui/screen/format_num with storage temp
data modify storage temp show_charlist[2] append from storage temp intTotext

data modify storage temp int set from storage temp temp_array[2][1]
function eternal_return:gui/screen/format_num with storage temp
data modify storage temp show_charlist[2] append from storage temp intTotext

data modify storage temp int set from storage temp temp_array[2][2]
function eternal_return:gui/screen/format_num with storage temp
data modify storage temp show_charlist[2] append from storage temp intTotext

data modify storage temp int set from storage temp temp_array[2][3]
function eternal_return:gui/screen/format_num with storage temp
data modify storage temp show_charlist[2] append from storage temp intTotext

data modify storage temp int set from storage temp temp_array[2][4]
function eternal_return:gui/screen/format_num with storage temp
data modify storage temp show_charlist[2] append from storage temp intTotext


data remove storage temp temp_array