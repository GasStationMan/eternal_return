package org.EternalReturn.ERCharacter.GlobalMonobehav

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterLeftClickEvent
import org.EternalReturn.ERCharacter.Event.CharacterRayCastEvent
import org.EternalReturn.EREntity.EREntity
import org.EternalReturn.Util.DPEngine.Behaviour.MonobehaviourEvent
import org.bukkit.entity.Entity

/**
 * 플레이어가 왼쪽 클릭을 할 때마다 실행될 레이캐스트.
 * */
class PlayerRayCastingByLeftClicking : ERCharacterMonobehaviour<CharacterLeftClickEvent>() {


    override fun start(event: CharacterLeftClickEvent) {

        val pdir = getDir(getPlayer() as Entity);
        val pPos = getPos(getPlayer() as Entity);
        val out = vec3();

        //println("Event dispatched : " + this.javaClass + " for entities " + getMonobehavActorList().size);

        val hitList = ArrayList<EREntity>();

        for(erEntity in getMonobehavActorList()){
            //println(erEntity.javaClass)
            if(erEntity !is EREntity){
                continue;
            }
            //println("" + erEntity.collider.javaClass + " with " + erEntity.javaClass);
            val collider = erEntity.collider;
            if(collider.rayCasting(out, pPos, pdir)){
                //println("Ray hit to -> " + erEntity.javaClass);
                hitList.addLast(erEntity)
            }
        }
        if(hitList.isEmpty())return
        this.actor.submitEvent(CharacterRayCastEvent(hitList))
    }

    override fun update(eventList: Collection<MonobehaviourEvent>) {
        stopMonobehav();
    }

}