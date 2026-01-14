package org.EternalReturn.ERAnimal;

import org.EternalReturn.ERPlayer.ERPlayer;
import org.EternalReturn.Util.physics.Geometry.Cylinder;
import org.EternalReturn.Util.physics.Geometry.InfStraightLine;
import org.bukkit.Location;
import org.bukkit.entity.Entity;
import org.jetbrains.annotations.NotNull;

import java.util.List;

public class Bear extends ERAnimal{


    public Bear(@NotNull Location location) {
        super("animal_bear", location,
                new Cylinder(
                    new InfStraightLine(0,1,0, location.getX(), location.getY(), location.getZ()),
                        1,
                        3
                ));

        registerAnimation("ready",2.0d);
        registerAnimation("attack",2.3d);
        registerAnimation("move",3.5d);
        registerAnimation("skill",3.25d);
        registerAnimation("death",2.0d);
    }
    

    /**
     * 캐싱 상황까지 고려하여 플레이어 리스트를 뽑아냄
     * */

    private AnimalState state = AnimalState.READY;


    @Override
    public void script() {

        List<ERPlayer> list = getPlayersInRange(15.0);

        if(state == AnimalState.READY) {
            //이게 위로 가야지 state machine 이 정확히 동작함.
            if (isHit()) {
                this.state = AnimalState.ATTACK;
                this.isHit = false;
                this.actor.setAI(true);
                stopAnim();
                return;
            }

            if (!list.isEmpty()) {
                playAnim("ready");
                return;
            }
            stopAnim();
        }else{

            //rotating == look at a target
            Entity target = this.actor.getTarget();
            if(target == null) return;
            Entity root = this.getRootEntity();
            Location actorLoc = actor.getLocation();
            root.setRotation(actorLoc.getYaw(), root.getLocation().getPitch());

            //범위 내에 있는가?
            boolean isInDistance = isInDistance(3, actor, target);

            if(isInDistance){
                state = AnimalState.ATTACK;
            }else if(!isPlaying("attack")){
                state = AnimalState.MOVE;
            }

            if(state == AnimalState.MOVE){
                actor.setAI(true);
                if(this.actor.getVelocity().isZero()){
                    stopAnim();
                    return;
                }
                playAnim("move");
            }

            if(state == AnimalState.ATTACK){
                actor.setAI(false);
                playAnimForce("attack");
            }
        }

    }

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
