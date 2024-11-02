$bossbar set line4.id$(id) name [{"text":"남은 시간 : ","font":"centerbar/wait/remaining_text"},{"score":{"name":"#wait.remaining","objective":"CT1"},"font":"centerbar/wait/remaining_num","color":"aqua"},{"text":"초","font":"centerbar/wait/remaining_text","color":"white"}]
$bossbar set line3.id$(id) name [\
    {"score":{"name":"#wait.bg","objective":"CT1"},"font":"centerbar/wait/bg","color":"#4e5c24"},\
    {"translate":"space.-75","font":"minecraft:default"},\
    {"nbt":"wait_char","storage":"text","interpret":true,"font":"centerbar/wait/count","color":"#4e5c24"},{"text":"/18","font":"centerbar/wait/count","color":"#4e5c24"},{"translate":"space.53","font":"minecraft:default"}]