package org.EternalReturn.EREntity.GlobalMonobehav;

import org.EternalReturn.EREntity.EREntityMonobehaviour;
import org.EternalReturn.EREntity.Event.EREntityStunEvent;
import org.EternalReturn.Util.DPEngine.behaviour.MonobehaviourEvent;
import org.bukkit.Location;

import java.util.Collection;

public class Stun extends EREntityMonobehaviour<EREntityStunEvent> {

    private long startStunMillies;
    private long duration;
    private Location stunLocation;

    @Override
    public void start(EREntityStunEvent event) {
        startStunMillies = event.startStunMillies;
        duration = event.duration;
        stunLocation = getEntity().getLocation();
        System.out.println("Stun event dispatched");
    }

    @Override
    public void update(Collection<MonobehaviourEvent> event) {
        if(isNotEnd(startStunMillies,duration)){
            getEntity().teleport(stunLocation);
            return;
        }
        stopMonobehav();
    }
}
