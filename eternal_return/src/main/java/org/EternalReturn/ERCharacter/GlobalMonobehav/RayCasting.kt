package org.EternalReturn.ERCharacter.GlobalMonobehav

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterLeftClickEvent
import org.EternalReturn.Util.Monobehaviour.MonobehaviourEvent


public class RayCasting : ERCharacterMonobehaviour<CharacterLeftClickEvent>() {

    override fun start(event: CharacterLeftClickEvent) {
        //val Physics = getPhysicsEngine()

        //val vector: Vector3 = Physics.vec3();

        player.sendMessage("Raycasting event submitted");

    }

    override fun update(eventList: MutableList<MonobehaviourEvent>) {

    }
}