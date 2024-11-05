## 화면에 표기되는 캐릭터 배열 불러오기
function pdb:get_me

    scoreboard players set #1 NUM 1

    scoreboard players operation #temp.data.index NUM = @s Page.frame
    scoreboard players operation #temp.data.index NUM -= #1 NUM

    # 프레임 라인 tmp 스토리지 임시저장
        execute store result storage temp index.index0 int 1 run scoreboard players get #temp.data.index NUM
        scoreboard players add #temp.data.index NUM 1
        execute store result storage temp index.index1 int 1 run scoreboard players get #temp.data.index NUM
        scoreboard players add #temp.data.index NUM 1
        execute store result storage temp index.index2 int 1 run scoreboard players get #temp.data.index NUM

    # 가져오기
        function eternal_return:gui/screen/display/select_character/get_frame_data with storage temp index

    # free
        scoreboard players reset #1 NUM
        scoreboard players reset #temp.data.index NUM
        data remove storage temp index

function pdb:save_me