## 스코어보드 생성
# 플레이어 아이디

scoreboard objectives add ER.resurrection dummy

scoreboard objectives add ChatClick trigger
scoreboard objectives add shift minecraft.custom:minecraft.sneak_time





# sidebar 로그 스코어 생성
scoreboard objectives add ER.log dummy






# df_library 전용 스코어보드 생성
#function df_library:init

# 보스바 기본 설정
function eternal_return:sys/bossbar/init

# 게임 설정
function eternal_return:sys/game/defualt_setting