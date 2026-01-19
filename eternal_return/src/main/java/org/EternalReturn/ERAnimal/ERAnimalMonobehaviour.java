package org.EternalReturn.ERAnimal;

import org.EternalReturn.ERAnimal.Event.ERAnimalEvent;
import org.EternalReturn.Util.Behaviour.Monobehaviour;
import org.EternalReturn.Util.Behaviour.MonobehaviourActor;
import org.EternalReturn.Util.Behaviour.MonobehaviourEvent;
import org.bukkit.entity.Entity;

import java.util.List;

public abstract class ERAnimalMonobehaviour<T extends ERAnimalEvent> extends Monobehaviour<T> {

    private ERAJEntity erAJEntity;
    private ERAnimal erAnimal;

    private void __init(){
        if(erAJEntity != null){
            return;
        }
        if(!(this.actor instanceof ERAnimal)){
            throw new ClassCastException("Actor가 ERCharacter가 아닙니다.");
        }
        erAnimal = (ERAnimal)this.actor;
        erAJEntity = erAnimal.ajEntity;
    }

    public ERAJEntity getERAJEntity(){
        __init();
        return this.erAJEntity;
    }

    public ERAnimal getERAnimal(){
        __init();
        return this.erAnimal;
    }

    //protected void damage(Player attacker, LivingEntity victim, double dmg){
    //    ERPlayerListener.addAPIAttacker(attacker);
    //    victim.damage(dmg, attacker);
    //}

    protected boolean isNotEnd(long startTime, long durationTicks){
        return System.currentTimeMillis() - startTime < durationTicks * 50;
    }

    public boolean isContainedIn(Class<? extends ERAnimalEvent> eventType, List<MonobehaviourEvent> eventList){
        for(MonobehaviourEvent event : eventList){
            if(eventType.isInstance(event)){
                return true;
            }
        }
        return false;
    }

    @Override
    public abstract void start(T event);

    @Override
    public abstract void update(List<MonobehaviourEvent> eventList);

    public boolean isInDistance(double r, Entity e0, Entity e1){
        double tx = e0.getLocation().getX();
        double ty = e0.getLocation().getY();
        double tz = e0.getLocation().getZ();

        double ax = e1.getLocation().getX();
        double ay = e1.getLocation().getY();
        double az = e1.getLocation().getZ();

        double dx = ax - tx;
        double dy = ay - ty;
        double dz = az - tz;

        return (dx*dx + dy*dy + dz*dz <= r * r);
    }


}
