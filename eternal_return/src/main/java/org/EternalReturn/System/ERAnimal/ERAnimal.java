package org.EternalReturn.System.ERAnimal;

import org.EternalReturn.Util.AnimatedJAVAEntity.AJEntity;
import org.EternalReturn.Util.Physics.Geometry.Collider;
import org.bukkit.Bukkit;
import org.bukkit.World;
import org.bukkit.entity.Entity;
import org.bukkit.entity.EntityType;
import org.bukkit.entity.Husk;
import org.bukkit.entity.TextDisplay;
import org.jetbrains.annotations.NotNull;

public class ERAnimal<T extends Collider> extends AJEntity {

    private Husk actor;

    private @NotNull T collider;

    private TextDisplay bar;

    public ERAnimal(String name, @NotNull T hitbox) {
        super(name);
        this.collider = hitbox;
    }

//    @Override
//    public void summon(Entity summoner) {
//        super.summon(summoner);
//
//        World world = summoner.getWorld();
//
//        Entity actor = world.spawnEntity(summoner.getLocation(), EntityType.HUSK);
//
//        Entity textDisplay = world.spawnEntity(summoner.getLocation(), EntityType.TEXT_DISPLAY);
//
//        Entity rootEntity = super.getRootEntity();
//
//        actor.addPassenger(rootEntity);
//
//        rootEntity.addPassenger(textDisplay);
//
//        this.actor = (Husk)actor;
//
//        this.bar = (TextDisplay)textDisplay;
//    }

    //getter
    /**
     * 해당 객체의 ACTOR을 얻어온다. <br>
     * @ACTOR : 해당 객체가 참조하는 AJEntity의 rootEntity를 passenger로 삼는 엔티티를 말한다.
     * */
    public Entity getActor(){
        return this.actor;
    }

    /**
     * 해당 ER Animal의 Collider를 가져온다.
     * */
    public @NotNull T getCollider(){
        return this.collider;
    }
    
    /**
     * 해당 ER Animal의 Bar(체력, 이름, 레벨 등을 표시하는 막대)를 가져온다.
     * */
    public TextDisplay getBar(){
        return this.bar;
    }


}
