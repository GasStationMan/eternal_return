package org.EternalReturn.ERCharacter.Character.aya

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterLeftClickEvent
import org.EternalReturn.ERCharacter.Event.CharacterRayCastEvent
import org.EternalReturn.EREntity.EREntity
import org.EternalReturn.Util.DPEngine.Behaviour.MonobehaviourEvent
import org.EternalReturn.Util.DPEngine.Geometry.GeometryEngine
import org.bukkit.entity.Entity

class Shoot : ERCharacterMonobehaviour<CharacterRayCastEvent>() {

    override fun start(event: CharacterRayCastEvent) {

        for(erEntity in event.hitEntities){

        }

    }

    override fun update(eventList: Collection<MonobehaviourEvent>) {

    }
}