## 키오스크 클릭
# 키오스크 클릭시 태그와 플레이어에게 페이지 번호 부여
execute as @e[tag=kiosk,tag=interaction,tag=!be_use] at @s on target run tag @p[distance=..1.3] add open_kiosk
execute as @e[tag=kiosk,tag=interaction,tag=!be_use] if data entity @s interaction run tag @s add be_use

# 채팅창 클릭 허용
scoreboard players enable @a[tag=open_kiosk] ChatClick

## 키오스크 페이지
execute as @a[tag=open_kiosk] at @s run function eternal_return:sys/kiosk/display

# 플레이어가 키오스크 감지 반경을 넘어가면 페이지 화면 제거 및 스코어 초기화
execute as @a[tag=open_kiosk] at @s if entity @e[tag=kiosk,tag=interaction,tag=be_use,distance=1.3..3] run function df_library:window/resetchat
execute as @a[tag=open_kiosk] at @s if entity @e[tag=kiosk,tag=interaction,tag=be_use,distance=1.3..3] run tag @s remove open_kiosk

# 키오스크가 사용중일 때 플레이어가 주변에서 벗어나면 태그 및 우클릭 태그 삭제
execute as @e[tag=kiosk,tag=interaction,tag=be_use] at @s unless entity @a[distance=..1.3,tag=open_kiosk] run data remove entity @s interaction
execute as @e[tag=kiosk,tag=interaction,tag=be_use] at @s unless entity @a[distance=..1.3,tag=open_kiosk] run tag @s remove be_use