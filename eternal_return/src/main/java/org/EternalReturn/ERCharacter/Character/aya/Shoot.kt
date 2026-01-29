package org.EternalReturn.ERCharacter.Character.aya

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterRayCastEvent
import org.EternalReturn.Util.DPEngine.behaviour.MonobehaviourEvent

class Shoot : ERCharacterMonobehaviour<CharacterRayCastEvent>() {

    override fun start(event: CharacterRayCastEvent) {

        for(erEntity in event.hitEntities){

        }

    }

    override fun update(eventList: MutableCollection<MonobehaviourEvent>) {

    }
}