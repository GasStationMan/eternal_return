package org.EternalReturn.EREntity.GlobalMonobehav;

import org.EternalReturn.EREntity.EREntityMonobehaviour;
import org.EternalReturn.EREntity.Event.EREntityDamagedEvent;
import org.EternalReturn.Util.DPEngine.Behaviour.MonobehaviourEvent;
import org.bukkit.entity.Entity;
import org.bukkit.entity.LivingEntity;

import java.util.Collection;

public class InfinityHealing extends EREntityMonobehaviour<EREntityDamagedEvent> {

    @Override
    public void start(EREntityDamagedEvent event) {
        Entity entity = getActor().getEntity();
        if(entity instanceof LivingEntity livingEntity){
            livingEntity.setHealth(20);
            System.out.println("Event dispatched");
        }
    }

    @Override
    public void update(Collection<MonobehaviourEvent> eventList) {

    }
}
