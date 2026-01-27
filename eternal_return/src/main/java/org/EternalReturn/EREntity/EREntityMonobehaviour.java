package org.EternalReturn.EREntity;

import org.EternalReturn.EREntity.Event.EREntityEvent;
import org.EternalReturn.System.EREngine;
import org.EternalReturn.Util.DPEngine.Behaviour.Monobehaviour;
import org.EternalReturn.Util.DPEngine.Behaviour.MonobehaviourEvent;
import org.bukkit.entity.Entity;
import org.jetbrains.annotations.NotNull;

public abstract class EREntityMonobehaviour<T extends EREntityEvent> extends Monobehaviour<T> {

    protected @NotNull EREntity getActor(){
        return (EREntity) super.actor;
    }

    protected @NotNull Entity getEntity(){
        return ((EREntity) super.actor).getEntity();
    }

    protected boolean isNotEnd(long startTime, long durationTicks){
        return System.currentTimeMillis() - startTime < durationTicks * 50;
    }

    protected @NotNull EREngine getEREngine(){
        return (EREngine) this.dpEngine;
    }

}
