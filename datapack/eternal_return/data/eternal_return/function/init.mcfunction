## 스코어보드 생성

scoreboard objectives add ER.resurrection dummy
scoreboard objectives add credit dummy
scoreboard objectives add ChatClick trigger
scoreboard objectives add shift minecraft.custom:minecraft.sneak_time
scoreboard objectives add quit minecraft.custom:minecraft.leave_game
scoreboard objectives add hp health {"text":"♥","color":"red"}

# 쿨타임
scoreboard objectives add CT1 dummy
scoreboard objectives add CT2 dummy
scoreboard objectives add CT3 dummy
scoreboard objectives add SC dummy

# 정수
scoreboard objectives add NUM dummy

# sidebar 로그 스코어 생성
scoreboard objectives add ER.log dummy

# 야생동물 관련 스코어보드 생성
scoreboard objectives add ER.sys dummy
scoreboard objectives add ER.health dummy
scoreboard objectives add ER.motionX dummy
scoreboard objectives add ER.motionY dummy
scoreboard objectives add ER.motionZ dummy

scoreboard objectives add ER.cooltime dummy
scoreboard objectives add df_id dummy

# 플레이어 uuid 스코어보드 생성
scoreboard objectives add ER.UUID.0 dummy
scoreboard objectives add ER.UUID.1 dummy
scoreboard objectives add ER.UUID.2 dummy
scoreboard objectives add ER.UUID.3 dummy


# df_library 전용 스코어보드 생성
#function df_library:init


# 플레이어 기본 설정
function eternal_return:sys/player/init
# 보스바 기본 설정
function eternal_return:sys/bossbar/init
# 액션바 기본 설정
function eternal_return:sys/actionbar/init
# 맵 기본 설정
function eternal_return:sys/map/init