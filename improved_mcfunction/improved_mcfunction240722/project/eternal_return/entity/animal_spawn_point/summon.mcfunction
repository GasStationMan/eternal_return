
# 야생동물 소환용 마커를 소환하는 함수입니다.
#> function eternal_return:entity/animal_spawn/point/boar

storage Animal_Information is minecraft:temp temp
entity  ThisEntity         is @s
score   LenOfARR           is @s ER.sys
score   Cooltime_To_Summon is @s ER.cooltime
$Animal_Information = {animal : $(animal)}

execute at @s\
    summon minecraft:marker run function with Animal_Information:
    tag  @s += this
    tag  @s += ER
    tag  @s += ER.spawn
    tag  @s += ER.spawn.animal
    $tag @s += ER.spawn.animal.$(animal)
    ThisEntity nbt data = {animal:[]}
    LenOfARR = 0
    Cooltime_To_Summon = 0
    tp @s ~ ~3 ~ ~ 0
    execute summon minecraft:text_display :
        ThisEntity nbt billboard = "center"
        ThisEntity nbt text = '{"text":"test"}'
        ride @e[type=minecraft:marker,tag=this,limit=1] mount @s
    
    tag @s += this
    $say $(animal) spawn point has been summoned!
    tag @s remove this


