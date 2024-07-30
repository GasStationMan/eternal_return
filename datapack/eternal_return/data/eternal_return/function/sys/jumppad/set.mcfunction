## 하이퍼루프 설치 8개
# 공장
execute positioned -533 82 323 run function eternal_return:sys/jumppad/summon {rotation:0,place:"zfactory"}
# 항구
execute positioned -429 82 354 run function eternal_return:sys/jumppad/summon {rotation:90,place:"zharbor"}
# 고급 주택가
execute positioned -386 81 478 run function eternal_return:sys/jumppad/summon {rotation:130,place:"zresidential_area"}
# 연못1
execute positioned -650 82 475 run function eternal_return:sys/jumppad/summon {rotation:60,place:"zpondA_1"}
execute positioned -660 79 478 run function eternal_return:sys/jumppad/summon {rotation:-110,place:"zpondA_2"}
# 연못2
execute positioned -622 82 465 run function eternal_return:sys/jumppad/summon {rotation:-55,place:"zpondB_1"}
execute positioned -593 82 485 run function eternal_return:sys/jumppad/summon {rotation:125,place:"zpondB_2"}

# 모델링 넘버 0번 부여
scoreboard players set @e[tag=jumppad] CT2 0