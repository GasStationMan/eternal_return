## 캐릭터 데이터에서 프레임 배열에 저장된 3줄만 가져오기
# 입출력 없음
# 상위 함수 : function eternal_return:gui/screen/display/select_character
# 

    # 인덱스 n ~ n+2 번호 생성
        scoreboard players operation #temp.data.index0 NUM = @s Page.frame
        scoreboard players operation #temp.data.index1 NUM = @s Page.frame
        scoreboard players operation #temp.data.index2 NUM = @s Page.frame
        scoreboard players add #temp.data.index1 NUM 1
        scoreboard players add #temp.data.index2 NUM 2

    # 인덱스 번호 스토리지에 임시 저장
        execute store result storage temp index.index0 int 1 run scoreboard players get #temp.data.index0 NUM
        execute store result storage temp index.index1 int 1 run scoreboard players get #temp.data.index1 NUM
        execute store result storage temp index.index2 int 1 run scoreboard players get #temp.data.index2 NUM

    # 캐릭터 배열에서 화면 프레임 배열로 인덱스 번호로 가져오기
        function eternal_return:gui/screen/display/select_character/get_frame_data with storage temp index

    # free
        scoreboard players reset #temp.data.index0 NUM
        scoreboard players reset #temp.data.index1 NUM
        scoreboard players reset #temp.data.index2 NUM
        data remove storage temp index

