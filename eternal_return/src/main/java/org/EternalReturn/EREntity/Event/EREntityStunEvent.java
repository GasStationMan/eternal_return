package org.EternalReturn.EREntity.Event;

public class EREntityStunEvent implements EREntityEvent {

    public long startStunMillies;
    public long duration;

    public EREntityStunEvent(long durationTicks){
        this.startStunMillies = System.currentTimeMillis();
        this.duration = durationTicks;
    }

}
