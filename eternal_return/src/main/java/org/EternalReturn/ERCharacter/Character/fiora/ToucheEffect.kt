package org.EternalReturn.ERCharacter.Character.fiora

import org.EternalReturn.ERCharacter.Character.fiora.event.ToucheEffectStartEvent
import org.EternalReturn.EREntity.EREntityMonobehaviour
import org.EternalReturn.util.dpengine.behaviour.MonobehaviourEvent
import org.bukkit.Location
import org.bukkit.Particle
import org.bukkit.entity.LivingEntity

class ToucheEffect : EREntityMonobehaviour<ToucheEffectStartEvent>(){

    lateinit var loc: Location;
    var startDurationMillis : Long = 0;
    var durationTicks : Long = 0;

    override fun start(event: ToucheEffectStartEvent) {
        loc = event.location;
        startDurationMillis = System.currentTimeMillis();
        durationTicks = event.durationTicks;
    }


    var count = 0;
    override fun update(eventList: MutableCollection<MonobehaviourEvent>) {
        if(isNotEnd(startDurationMillis, durationTicks)){
            for(event in eventList){
                if(event is ToucheEffectStartEvent){
                    count = event.count;
                    println("$count of point");
                }
            }
            drawParticles(loc, count);
            return;
        }
        stopMonobehav();
    }

    private fun drawParticles(loc: Location, count: Int) {
        val dist = 0.7
        val points = arrayOf(
            loc.clone().add(dist, 0.1, 0.0),
            loc.clone().add(-dist, 0.1, 0.0),
            loc.clone().add(0.0, 0.1, dist),
            loc.clone().add(0.0, 0.1, -dist)
        )
        for (i in 0 until count) {
            loc.world!!.spawnParticle(Particle.GLOW, points[i], 1, 0.0, 0.1, 0.0, 0.0)
        }
    }
}