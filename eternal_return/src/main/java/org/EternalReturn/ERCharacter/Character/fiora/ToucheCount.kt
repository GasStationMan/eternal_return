package org.EternalReturn.ERCharacter.Character.fiora

import org.EternalReturn.ERCharacter.Character.fiora.event.ERToucheCountEvent
import org.EternalReturn.ERCharacter.Character.fiora.event.ToucheEffectStartEvent
import org.EternalReturn.EREntity.EREntityMonobehaviour
import org.EternalReturn.util.dpengine.behaviour.MonobehaviourEvent
import org.bukkit.entity.LivingEntity
import org.jetbrains.annotations.NotNull

/**
 * 이거는 EREntity에게 적용되는 Monobehaviour입니다.
 * 해당 Monobehaviour은 피오라에게 적용되어 있지 않고
 * EREntity에 적용되어 있습니다.
 * */
class ToucheCount : EREntityMonobehaviour<ERToucheCountEvent>() {

    var count = 0;
    val durationTicks : Long = 100;
    var startTime : Long = 0;

    override fun start(event: ERToucheCountEvent) {

        val victim : LivingEntity =  this.getEREntity().entity as LivingEntity;

        println("CurrentCount : $count ");
        if(count >= 4) {
            event.player.sendMessage("§f[피오라] §b§l팡뜨! §f적중");
            victim.damage(20.0, event.player);
            count = 0;
            this.getEREntity().submitEvent(ToucheEffectStartEvent(victim.location, durationTicks, count));
            stopMonobehav();
            return;
        }

        if(isNotEnd(startTime, durationTicks)){
            count ++;
            startTime = System.currentTimeMillis();
            event.player.sendMessage("카운트 : $count");
            this.getEREntity().submitEvent(ToucheEffectStartEvent(victim.location, durationTicks, count));
            stopMonobehav();
            return;
        }
        else{
            count = 1;
            event.player.sendMessage("타임아웃 ! 카운트 : $count");
            startTime = System.currentTimeMillis();
            this.getEREntity().submitEvent(ToucheEffectStartEvent(victim.location, durationTicks, count));
            stopMonobehav();
            return;
        }
    }

    override fun update(eventList: MutableCollection<MonobehaviourEvent>) {
        stopMonobehav();
    }


}