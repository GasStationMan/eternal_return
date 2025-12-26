## 카메라 오버레이
# 상위 함수 : function eternal_return:main
# 입출력 없음

# 카메라 오버레이 OFF
    clear @s[tag=on_camera_overlay,tag=off_camera_overlay] paper[hide_tooltip={}]
    tag @s[tag=on_camera_overlay,tag=off_camera_overlay] remove on_camera_overlay
    execute if entity @s[tag=off_camera_overlay] run return run tag @s remove off_camera_overlay
# 카메라 오버레이 ON
    execute if entity @s[tag=on_camera_overlay] run function eternal_return:gui/camera_overlay/replace_empty
