package org.EternalReturn.System.ERAnimal;

import org.EternalReturn.Util.Physics.MathVector.Vec3d;
import org.bukkit.event.Event;
import org.bukkit.event.HandlerList;
import org.jetbrains.annotations.NotNull;

import java.util.LinkedList;
import java.util.List;

public class ERAnimalAttackEvent extends Event {

    private static HandlerList handlers = new HandlerList();

    private ERAnimal erAnimal;

    private double distSq;

    public ERAnimalAttackEvent(ERAnimal erAnimal, double distSq) {
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
