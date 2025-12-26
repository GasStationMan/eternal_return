scoreboard objectives add df_debug dummy
tellraw @a [{"text":"[DF_LIBRARY_DEBUGGER] ","color":"green"},{"text":"DF_library debbuger turned on.\nPlease turn off this mode when you don't need it. It could make your datapack slow.\nDF_library debbuger가 동작합니다. 성능 저하를 피하기 위해 디버깅 이외에는 사용하지 마십시오.","color":"white"}]
scoreboard players set #df_lib.debug df_debug 1
scoreboard objectives setdisplay sidebar df_debug
