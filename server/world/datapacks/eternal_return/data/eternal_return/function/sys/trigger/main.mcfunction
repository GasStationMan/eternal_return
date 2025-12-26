#
##> trigger 스코어 주소 정리
#
#   1~6 : 키오스크 구매
#

## 키오스크
execute if score @s[tag=open_kiosk] ChatClick matches 1..6 run function eternal_return:sys/trigger/kiosk