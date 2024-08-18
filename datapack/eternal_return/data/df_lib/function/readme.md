df_lib 라이브러리 내 함수 호출 이름 규약
function <foo>/<bar>
return -> #<foo> <bar>

예시 :
    1. 매개변수는 함수 이름 끝 _이후, _로 구분된 스코어보드의 이름에 #을 붙인 것이 곧 매개변수이다.
    scoreboard players set #a <foo>
    scoreboard players set #b <foo>
    function math:add_a_b
    scoreboard players operation #result score = #add <foo>

    2. 함수 이름이 /로 나뉘어져 있을 경우 /을 .으로 교체한다.

    scoreboard players operation #v1x <foo> = @s playerDirectionX
    scoreboard players operation #v1y <foo> = @s playerDirectionY

    scoreboard players operation #v2x <foo> = @n[...] playerDirectionX
    scoreboard players operation #v2y <foo> = @n[...] playerDirectionY

    function math:vec2d/dotprod_v1x_v1y_v2x_v2y
    scoreboard players operation #resultX <bar> = #vec2d.dotprod <foo>

    3. vec2d 또는 vec3d인 경우, 반환값은 후술한다.

함수 목록
    float4 : -> int 자료형으로 되어 있는 스코어보드를 변수 당 하나 사용하며, 정수 부분 유효 4자리, 소수 부분 유효 4자리를 사용한다.
        vec2d : -> 위 자료형을 이용한 벡터 함수이다.
            
            1. function df_lib:float4/vec2d/add_v1x_v1y_v2x_v2y/main
                설명 : 두 벡터를 더한다. 사실 쓸 일이 없다.
                input : 
                    #v1x float 
                    #v1y float 
                    #v2x float 
                    #v2y float
                return : 
                    #float4.vec2d.add.x float
                    #float4.vec2d.add.y float
            
            2. function df_lib:float4/vec2d/cross_prod_v1x_v1y_v2x_v2y/main
                설명 : 두 벡터의 외적을 계산하여 반환한다. 반환 값의 방향은 +z 또는 -z 방향이다. 다만 x,y값은 계산되지 않는다. (애초에 0이기에)
                input : 
                    #v1x float 
                    #v1y float 
                    #v2x float 
                    #v2y float
                return : 
                    #float4.vec2d.cross_prod float
            
            3. function df_lib:float4/vec2d/dot_prod_v1x_v1y_v2x_v2y/main
                설명 : 두 벡터의 내적을 계산하여 반환한다.
                input : 
                    #v1x float 
                    #v1y float 
                    #v2x float 
                    #v2y float
                return : 
                    #float4.vec2d.dot_prod float
            
            4. function df_lib:float4/vec2d/get_entity_direction/main
                설명 : 주체로 설정된 엔티티의 크기가 1인 방향벡터를 반환한다.
                input : 
                    @s : execute as @s run df_lib:float4/vec2d/get_entity_direction/main
                return : 
                    #float4.vec2d.get_entity_direction.x float
                    #float4.vec2d.get_entity_direction.y float
            
            5. function df_lib:float4/vec2d/get_entity_pos/main
                설명 : 주체로 설정된 엔티티의 위치벡터를 반환한다.
                input : 
                    @s : execute as @s run df_lib:float4/vec2d/get_entity_direction/main
                return : 
                    #float4.vec2d.get_entity_direction.x float
                    #float4.vec2d.get_entity_direction.y float



        vec3d : #함수 옆 ()으로 추가 설명된 함수의 경우 다음으로 해석하셔야 합니다.
                1. (권장되지 않음)  : 대체 함수보다 떨어지는 성능을 가진 경우 / 동작은 하나 버그가 확실히 관찰되는 경우
                2. (사용 금지)      : 사용 시 심각한 버그가 높은 확률로 생길 수 있는 경우
                3. 없음             : 사용 권장

            1. function df_lib:float4/vec3d/dot_prod_v1x_v1y_v1z_v2x_v2y_v2z/main
                설명 : 두 벡터의 내적을 계산하여 반환한다.
                input : 
                    #v1x float
                    #v1y float
                    #v1z float
                    #v2x float
                    #v2y float
                    #v2z float
                output : 
                    #float4.vec3d.dot_prod float
                
            2. function df_lib:float4/vec3d/get_entity_direction/main
                설명 : 주체로 설정된 엔티티의 크기가 1인 방향벡터를 반환한다.
                output : 
                    #float4.vec3d.get_entity_direction.x float
                    #float4.vec3d.get_entity_direction.y float
                    #float4.vec3d.get_entity_direction.z float
            
            3. function df_lib:float4/vec3d/get_entity_pos/main
                설명 : 주체로 설정된 엔티티의 크기가 1인 방향벡터를 반환한다.
                output : 
                    #float4.vec3d.get_entity_pos.x float
                    #float4.vec3d.get_entity_pos.y float
                    #float4.vec3d.get_entity_pos.z float
            
            4. function df_lib:float4/vec3d/get_projectile_motion/main
                설명 : 주체로 설정된 중력이 작용하는 엔티티의 Motion 값을 가져온다.
                output : 
                    #float4.vec3d.get_projectile_motion.x float
                    #float4.vec3d.get_projectile_motion.y float
                    #float4.vec3d.get_projectile_motion.z float
            
            5. function df_lib:float4/vec3d/new_hitbox/main {width:1,height:1}
                설명 : 현 라이브러리의 벡터 계산이 지원되는 히트박스(인터렉션)를 소환한다. @e[tag = df_lib_hitbox]로 찾을 수 있다.
                output :
                    @e[type=minecraft:interaction, tag = df_lib_hitbox]
                    -> 단, 감지된 엔티티는 사용 후 태그를 제거해야 한다.

            6. function df_lib:float4/vec3d/entity_detect_hitbox_raycast/main
                설명 : 주체로 설정된 플레이어의 전방 30도, 반지름이 10인 부채꼴 영역에서 감지된 히트박스에 광선을 투사하여, 광선에 맞은 히트박스를 반환한다.
                        (여기서 광선이란 플레이어의 위치와 방향을 토대로 계산된 , X0 + tv 꼴의 직선을 말하며, 0 <= t이다.)
                output 
                    @e[type=minecraft:interaction, tag = entity_detect_hitbox_raycast]
                    -> 단, 감지된 엔티티는 사용 후 태그를 제거해야 한다.
            
            7. function df_lib:float4/vec3d/detect_hitbox_raycast/main (권장되지 않음)
                설명 : 6과 기능은 동일하나, 주체가 히트박스이다. function df_lib:float4/vec3d/entity_detect_hitbox_raycast/main
                      보다 최적화 면에서 떨어진다.
                output :
                    @e[type=minecraft:interaction, tag = entity_detect_hitbox_raycast]
            
            8. function df_lib:float4/vec3d/detect_hitbox_stepsize/main (권장되지 않음)
                설명 : 주체가 된 히트박스 범위에 화살이 관통했는지 확인하는 함수이며, 정확성이 떨어짐과 동시에 최적화 면에서 떨어지는 성능을 가짐.
                output : 
                    없음

            9. function df_lib:float4/vec3d/detect_inf_plane_nx_ny_nz_ox_oy_oz_get_entity_pos_get_entity_direction/main
                설명 : nx,ny,nz의 수직노멀벡터를 지니고, ox,oy,oz를 지나는 무한평면을 
                        get_entity_pos/main 함수와 get_entity_directio/main 함수를 사용하여 얻은 값으로 계산된 직선이
                        평면과 한 점에서 만나는 지 확인한다.
                output : 
                    float4.vec3d.detect_inf_plane float
            
            10. function df_lib:float4/vec3d/update_hitbox/main
                설명 : 주체가 된 히트박스가 지닌 값(스코어보드)을 현재 위치에 따라 다시 계산한다.
                ouput :
                    (재 계산 된)
                    @s float4.vec3.Plane_pX.Nx
                    @s float4.vec3.Plane_pX.Ny
                    @s float4.vec3.Plane_pX.Nz
                    @s float4.vec3.Plane_pX.Ox
                    @s float4.vec3.Plane_pX.Oy
                    @s float4.vec3.Plane_pX.Oz
                    @s float4.vec3.Plane_pY.Nx
                    @s float4.vec3.Plane_pY.Ny
                    @s float4.vec3.Plane_pY.Nz
                    @s float4.vec3.Plane_pY.Ox
                    @s float4.vec3.Plane_pY.Oy
                    @s float4.vec3.Plane_pY.Oz
                    @s float4.vec3.Plane_pZ.Nx
                    @s float4.vec3.Plane_pZ.Ny
                    @s float4.vec3.Plane_pZ.Nz
                    @s float4.vec3.Plane_pZ.Ox
                    @s float4.vec3.Plane_pZ.Oy
                    @s float4.vec3.Plane_pZ.Oz
                    @s float4.vec3.Plane_nX.Nx
                    @s float4.vec3.Plane_nX.Ny
                    @s float4.vec3.Plane_nX.Nz
                    @s float4.vec3.Plane_nX.Ox
                    @s float4.vec3.Plane_nX.Oy
                    @s float4.vec3.Plane_nX.Oz
                    @s float4.vec3.Plane_nY.Nx
                    @s float4.vec3.Plane_nY.Ny
                    @s float4.vec3.Plane_nY.Nz
                    @s float4.vec3.Plane_nY.Ox
                    @s float4.vec3.Plane_nY.Oy
                    @s float4.vec3.Plane_nY.Oz
                    @s float4.vec3.Plane_nZ.Nx
                    @s float4.vec3.Plane_nZ.Ny
                    @s float4.vec3.Plane_nZ.Nz
                    @s float4.vec3.Plane_nZ.Ox
                    @s float4.vec3.Plane_nZ.Oy
                    @s float4.vec3.Plane_nZ.Oz
                    @s float4.vec3.width
                    @s float4.vec3.height