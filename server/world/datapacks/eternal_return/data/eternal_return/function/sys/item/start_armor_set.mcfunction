execute as @a[tag=player] run item replace entity @s armor.head with iron_helmet
execute as @a[tag=player] run item replace entity @s armor.chest with iron_chestplate
execute as @a[tag=player] run item replace entity @s armor.legs with iron_leggings
execute as @a[tag=player] run item replace entity @s armor.feet with iron_boots
execute as @a[tag=player] run item replace entity @s container.0 with iron_sword
execute as @a[tag=player] run item replace entity @s container.1 with bow
execute as @a[tag=player] run item replace entity @s container.2 with bread[food={nutrition:1,saturation:1,can_always_eat:true,eat_seconds:1,effects:[{effect:{id:"minecraft:instant_health",amplifier:0,duration:1,show_particles:0b,show_icon:1b},probability:1}]}] 3
execute as @a[tag=player] run item replace entity @s container.6 with arrow 5
execute as @a[tag=player] run item replace entity @s container.7 with red_bed
execute as @a[tag=player] run item replace entity @s container.8 with written_book[item_name='{"color":"yellow","text":"상점"}',written_book_content={title:"",author:"",generation:0,pages:['[{"text":"          [ ","color":"black"},{"text":"상점","color":"gold"},{"text":" ]\\n"},{"text":"\\n\\n\\n\\n"},{"text":"  ▶ 빵","color":"black","clickEvent":{"action":"run_command","value":"/function command:buy_bread"}},{"text":"   "},{"text":"▶ 화살","color":"black","clickEvent":{"action":"run_command","value":"/function command:buy_arrow"}},{"text":"   "},{"text":"▶ 철검","color":"black","clickEvent":{"action":"run_command","value":"/function command:buy_sword"}},{"text":"\\n"},{"text":" ⓒ 30  ⓒ 30  ⓒ 30","color":"gold","bold":true}]']}] 1


execute as @a[tag=player,tag=charlotte] run item replace entity @s container.4 with carrot_on_a_stick