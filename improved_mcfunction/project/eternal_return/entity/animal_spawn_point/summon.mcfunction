
# 야생동물 소환용 마커를 소환하는 함수입니다.
#> function eternal_return:entity/animal_spawn/point/boar

storage animal is minecraft:temp temp
entity  thisEntity         is @s
score   lenOfList          is @s ER.sys
score   cooltimeToSummon is @s ER.cooltime


$animal = {animal : $(animal)}
execute at @s \
summon minecraft:marker with animal:
    tag  @s add this
    tag  @s add ER
    tag  @s add ER.spawn
    tag  @s add ER.spawn.animal
    $tag @s add ER.spawn.animal.$(animal)
    thisEntity nbt data = {animal:[]}
    lenOfList = 0
    cooltimeToSummon = 6000
    tp @s ~ ~3 ~
    execute positioned as @s summon minecraft:text_display with animal:
        tag  @s add this
        tag  @s add ER
        tag  @s add ER.spawn
        tag  @s add ER.spawn.animal
        $tag @s add ER.spawn.animal.$(animal)
        tp @s ~ ~ ~ ~ 0
        thisEntity nbt billboard = "center"
        thisEntity nbt text = '{"text":"test"}'
        ride @n[type=minecraft:marker,tag=this] mount @s
    
execute rotated as @s as @e[type=minecraft:marker,tag=this] run tp @s ~ ~ ~ ~ 0
$say $(animal) spawn point has been summoned!
tag @e[tag=this] remove this



