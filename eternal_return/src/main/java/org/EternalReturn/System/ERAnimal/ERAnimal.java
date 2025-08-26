package org.EternalReturn.System.ERAnimal;

import org.EternalReturn.Util.AnimatedJAVAEntity.AJEntity;
import org.bukkit.entity.Entity;
import org.bukkit.entity.EntityType;

public class ERAnimal extends AJEntity {

    private Entity actor;

    public ERAnimal(String name) {
        super(name);

    }

    @Override
    public void summon(Entity summoner) {
        super.summon(summoner);
        Entity actor = summoner.getWorld().spawnEntity(summoner.getLocation(), EntityType.HUSK);
        this.actor = actor;
        actor.addPassenger(this.getRootEntity());

    }

    //getter

    /**
     * 해당 객체의 ACTOR을 얻어온다. <br>
     * @ACTOR : 해당 객체가 참조하는 AJEntity의 rootEntity를 passenger로 삼는 엔티티를 말한다.
     * */
    public Entity getActor(){
        return this.actor;
    }


}
