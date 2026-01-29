package org.EternalReturn.ERCharacter.Character.jackie

import org.EternalReturn.ERCharacter.ERCharacterMonobehaviour
import org.EternalReturn.ERCharacter.Event.CharacterKillEvent
import org.EternalReturn.Util.DPEngine.behaviour.MonobehaviourEvent
import org.bukkit.Location
import org.bukkit.Particle

class Passive : ERCharacterMonobehaviour<CharacterKillEvent>() {

    var endTimeMillis : Long = 0;

    override fun start(event: CharacterKillEvent) {
        val player = getPlayer();
        player.sendMessage("I killed");
        endTimeMillis = System.currentTimeMillis() + 40 * 50;

    }

    override fun update(eventList: MutableCollection<MonobehaviourEvent>) {
        if(endTimeMillis >= System.currentTimeMillis()){
            val loc : Location = getPlayer().location;
            val world = getPlayer().world;
            loc.y = loc.y + 2.5;
            world.spawnParticle(Particle.FLAME, loc, 3, 0.2, 0.1, 0.2, 0.02)
        }else{
            stopMonobehav();
        }
    }
}