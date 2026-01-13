package org.EternalReturn.ERAnimal;

import org.bukkit.event.Event;
import org.bukkit.event.HandlerList;
import org.jetbrains.annotations.NotNull;

public class ERAnimalHitEvent extends Event {

    private static HandlerList handlers = new HandlerList();

    private ERAnimal erAnimal;

    private double distSq;

    public ERAnimalHitEvent(ERAnimal erAnimal, double distSq) {
        this.erAnimal = erAnimal;
        this.distSq = distSq;
    }

    @Override
    public @NotNull HandlerList getHandlers() {
        return handlers;
    }

    public ERAnimal getERAnimal(){
        return this.erAnimal;
    }

    public double getDistSq(){
        return this.distSq;
    }

}
