## CCTV CoolDown text display
# 상위 함수 : function eternal_return:object/cctv/tick
# 입력 : (size) , (tag)    \
    size : (float)글자 크기         \
    tag : 추가 태그
# 출력 : 카운트다운용 텍스트 디스플레이 생성


# 개체 재소환
    $kill @n[tag=cool,tag=$(tag),type=text_display,distance=..5,limit=1]
    # 텍스트 디스플레이 소환
        $summon text_display ~ ~ ~ {billboard:"center",shadow:0b,Tags:["cool","$(tag)"],background:16711680,transformation:[$(size)f,0f,0f,0f,0f,$(size)f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f]}
