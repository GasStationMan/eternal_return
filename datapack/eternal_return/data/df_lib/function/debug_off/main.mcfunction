scoreboard objectives remove df_debug
tellraw @a [{"text":"[DF_LIBRARY_DEBUGGER] DF_library debbuger turned off\nDF_library debbuger가 종료되었습니다."}]
scoreboard players set #df_lib.debug df_debug 0
