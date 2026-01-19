package org.EternalReturn.ERCharacter.GlobalMonobehav

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterLeftClickEvent
import org.EternalReturn.EREntity.EREntity
import org.EternalReturn.Util.Behaviour.MonobehaviourEvent
import org.EternalReturn.Util.physics.Geometry.Cylinder
import org.EternalReturn.Util.physics.Geometry.Vector3
import org.bukkit.entity.Entity


public class RayCasting : ERCharacterMonobehaviour<CharacterLeftClickEvent>() {

    override fun start(event: CharacterLeftClickEvent) {

        val a = vec3(1.0, 1.0, 1.0);
        val b = vec3(2.0, 2.0, 2.0);
        val c = a + b;
        val d = a cross b;
        val e = a dot b;

        val pdir : Vector3 = getDir(getPlayer() as Entity);
        val pPos : Vector3 = getPos(getPlayer() as Entity);
        val out : Vector3 = pdir + pPos;

        //나중엔 콜라이더로 하여금 rayCasting을 호출하게 할 것.
        //collider.rayCast(out, pdir, pPos);

        for(erEntity in getMonobehavActorList()){
            if(erEntity !is EREntity){
                continue;
            }

            if(erEntity.collider == null){
                return;
            }

            val collider = erEntity.collider;

            if(collider is Cylinder){
                //geometryEngine.fgetIntersectPoint(out, pPos, pdir, collider);
            }

        }

    }

    override fun update(eventList: MutableList<MonobehaviourEvent>) {
        stopMonobehav();
    }
}