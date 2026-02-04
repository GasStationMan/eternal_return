package org.EternalReturn.System;

import org.EternalReturn.EREntity.EREntity;
import org.EternalReturn.ERAnimal.ERAnimalManager;
import org.EternalReturn.Util.dpengine.DPEngine;
import org.EternalReturn.Util.dpengine.geometry.Collider;
import org.bukkit.Location;
import org.bukkit.entity.Entity;

import java.util.HashMap;

/**
 * Bukkit 객체들과 유연하게 상호작용하기위한 엔진
 * */
public class EREngine extends DPEngine {

    private final HashMap<Entity, EREntity> erEntityMap = new HashMap<>();

    @Override
    public void update(){

        //for(ERPlayer erPlayer : SystemManager.getERPlayerHashMap().values()){
        //    Player p = erPlayer.getPlayer();
        //    Set<String> tags = p.getScoreboardTags();
        //
        //    erPlayer.getSkill().update();
        //    erPlayer.getMotionManager().update(tags);
        //}

        for(EREntity erEntity : erEntityMap.values()){
            if(erEntity.getEntity() == null)continue;

            Location loc = erEntity.getEntity().getLocation();
            Collider collider = erEntity.getCollider();
            collider.setPosition(loc.getX(), loc.getY(), loc.getZ());
            collider.setDirection(0.0, loc.getPitch(), 0.0);

        }

        ERAnimalManager.update(32);
    }

    /**
     * Entity를 통해서 MonobehaviourActor를 접근하기 위해 필요한 함수
     * 일반 registerMonobehaviourActor를 통해 등록 시 Entity를 통해 접근이 불가해짐.
     * */
    public void registerBukkitActor(Entity entity, EREntity actor){
        super.getMonobehaviourModule().registerMonobehaviourActor(actor);
        erEntityMap.put(entity,actor);
    }

    /**
     * 해당 Entity 객체에 맞는 EREntity(extends from MonobehaviourActor)를 반환함.
     * */
    public EREntity getEREntity(Entity entity) {
        return erEntityMap.get(entity);
    }
}