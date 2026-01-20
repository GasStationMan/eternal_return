package org.EternalReturn.ERCharacter.GlobalMonobehav

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterLeftClickEvent
import org.EternalReturn.EREntity.EREntity
import org.EternalReturn.Util.DPEngine.Behaviour.MonobehaviourEvent
import org.EternalReturn.Util.DPEngine.Geometry.Cylinder
import org.EternalReturn.Util.DPEngine.Geometry.Vector3
import org.bukkit.entity.Entity


public class RayCasting : ERCharacterMonobehaviour<CharacterLeftClickEvent>() {


    override fun start(event: CharacterLeftClickEvent) {

        val pdir = getDir(getPlayer() as Entity);
        val pPos = getPos(getPlayer() as Entity);
        val out = vec3();

        //println("Event dispatched : " + this.javaClass + " for entities " + getMonobehavActorList().size);

        for(erEntity in getMonobehavActorList()){

            //println(erEntity.javaClass)

            if(erEntity !is EREntity){
                continue;
            }

            //println("" + erEntity.collider.javaClass + " with " + erEntity.javaClass);

            val collider = erEntity.collider;
            if(collider.rayCasting(out, pPos, pdir)){
                println("Ray hit to -> " + erEntity.javaClass);
            }

        }

    }

    override fun update(eventList: Collection<MonobehaviourEvent?>?) {
        stopMonobehav();
    }

}