
function df_lib:window/resetchat
tellraw @s "======================================="
tellraw @s "                       ⓒ키오스크\n"
tellraw @s ["                      ",{"text":"▶ 특수 재료 ◀","color":"gray"}]
tellraw @s ["\n       ",{"text":"[생명의 나무]","bold":true,"clickEvent":{"action":"run_command","value":"/trigger ChatClick set 1"},"hoverEvent":{"action":"show_text","contents":[{"text":"클릭해서 구매하기","color":"gray"}]}}," ",{"text":"200","bold":false,"color":"green"},"        ",{"text":"[운석]","bold":true,"clickEvent":{"action":"run_command","value":"/trigger ChatClick set 2"},"hoverEvent":{"action":"show_text","contents":[{"text":"클릭해서 구매하기","color":"gray"}]}}," ",{"text":"200","bold":false,"color":"green"}]
tellraw @s ["       ",{"text":"[미스릴]","bold":true,"clickEvent":{"action":"run_command","value":"/trigger ChatClick set 3"},"hoverEvent":{"action":"show_text","contents":[{"text":"클릭해서 구매하기","color":"gray"}]}}," ",{"text":"250","bold":false,"color":"green"},"             ",{"text":"[VF 혈액 샘플]","bold":true,"clickEvent":{"action":"run_command","value":"/trigger ChatClick set 4"},"hoverEvent":{"action":"show_text","contents":[{"text":"클릭해서 구매하기","color":"gray"}]}}," ",{"text":"500","bold":false,"color":"green"}]
tellraw @s ["       ",{"text":"[포스코어]","bold":true,"clickEvent":{"action":"run_command","value":"/trigger ChatClick set 5"},"hoverEvent":{"action":"show_text","contents":[{"text":"클릭해서 구매하기","color":"gray"}]}}," ",{"text":"350","bold":false,"color":"green"},"           ",{"text":"[전술 강화 모듈]","bold":true,"clickEvent":{"action":"run_command","value":"/trigger ChatClick set 6"},"hoverEvent":{"action":"show_text","contents":[{"text":"클릭해서 구매하기","color":"gray"}]}}," ",{"text":"200","bold":false,"color":"green"}]
tellraw @s ""
#tellraw @s ["                      ",{"text":"▶ 팀원 부활 ◀","color":"gray"}]
#tellraw @s ["       ",{"text":"팀원1 부활","bold":false}," ",{"text":"200","bold":true,"color":"green"},"          ",{"text":"팀원2 부활","bold":false}," ",{"text":"200","bold":true,"color":"green"}]
#tellraw @s ""
#tellraw @s ["                      ",{"text":"▶ 탈출 재료 ◀","color":"gray"}]
#tellraw @s ["                      ",{"text":"루트킷1","bold":true,"clickEvent":{"action":"run_command","value":"/function eternal_return:sys/kiosk/buy/rootkit"},"hoverEvent":{"action":"show_text","contents":[{"text":"클릭해서 구매하기","color":"gray"}]}}," ",{"text":"150","bold":false,"color":"green"}]
tellraw @s "======================================="


