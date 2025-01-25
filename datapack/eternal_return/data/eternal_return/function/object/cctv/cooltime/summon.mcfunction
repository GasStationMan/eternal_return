## CCTV CoolDown text display
# 상위 함수 : function eternal_return:object/cctv/tick
# 입력 : (sec) \
    sec : 표기할 초단위
# 출력 : 카운트다운용 텍스트 디스플레이 생성



## 생성 되었을 때
    summon text_display ~ ~ ~ {billboard:"center",shadow:0b,Tags:["cool"],background:16711680,transformation:[2.5f,0f,0f,0f,0f,2.5f,0f,0f,0f,0f,1f,0f,0f,0f,0f,1f]}
    $scoreboard players set @e[tag=cool,distance=..3] ct2 $(sec)