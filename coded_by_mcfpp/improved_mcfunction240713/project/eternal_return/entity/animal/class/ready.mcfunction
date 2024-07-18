#===================================================================================================
#>  function eternal_return:entity/animal/class/ready
#===================================================================================================

# 체력이 최대 체력 미만인 경우 AI -> true
if score #this.HP ER.sys < #this.MaxHP ER.sys : 
    data modify entity @s NoAI set value 0b
    scoreboard players set #this.AI ER.sys 1



# 플레이어가 근처에 가면 발동 -> ready 애니메이션
$execute at @s if entity @p[distance=0..6] if score #this.HP ER.sys = #this.MaxHP ER.sys as @e[tag=!aj.animal_$(animal).animation.ready,tag=ER.animal.model,tag=this] run function animated_java:animal_$(animal)/animations/ready/play



