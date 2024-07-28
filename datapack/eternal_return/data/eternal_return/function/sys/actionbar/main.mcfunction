## 로딩바 
function eternal_return:temp/input/id

# 로딩바 표기
execute if entity @s[tag=show_loading] run function eternal_return:sys/actionbar/loading/show with storage player_data temp[0]

# 개인 스토리지 텍스트 받아오기
execute if entity @s[tag=get_text] run function eternal_return:sys/actionbar/loading/get_text with storage player_data temp[0]
tag @s[tag=get_text] remove get_text

# 개인 스토리지 비우기
execute if entity @s[tag=clear_loading] run function eternal_return:sys/actionbar/clear with storage player_data temp[0]

# 로딩바 채우기
execute if entity @s[tag=loading,tag=!pause_loading] run function eternal_return:sys/actionbar/loading/add_index with storage player_data temp[0]

# 로딩 취소
execute if entity @s[tag=cancel_loading] run function eternal_return:sys/actionbar/loading/cancel with storage player_data temp[0]

# 로딩 완료
execute if entity @s[tag=loading] run function eternal_return:sys/actionbar/loading/done with storage player_data temp[0]


function eternal_return:temp/free/id