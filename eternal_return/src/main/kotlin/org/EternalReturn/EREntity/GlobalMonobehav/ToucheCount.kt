package org.EternalReturn.EREntity.GlobalMonobehav

import org.EternalReturn.EREntity.EREntityMonobehaviour
import org.EternalReturn.EREntity.Event.ERToucheCountEvent
import org.EternalReturn.util.dpengine.behaviour.MonobehaviourEvent
import org.bukkit.entity.LivingEntity

class ToucheCount : EREntityMonobehaviour<ERToucheCountEvent>() {

    var count = 0;

    override fun start(event: ERToucheCountEvent) {

        val victim : LivingEntity =  this.getEREntity().entity as LivingEntity;

        println("CurrentCount : $count ");
        if(count >= 4){
            event.player.sendMessage("§f[피오라] §b§l팡뜨! §f적중");
            victim.damage(20.0, event.player);
            count = 0;
        }

        count++;

        event.player.sendMessage("카운트 : $count");

        stopMonobehav();

    }

    override fun update(eventList: MutableCollection<MonobehaviourEvent>) {
        stopMonobehav();
    }


}