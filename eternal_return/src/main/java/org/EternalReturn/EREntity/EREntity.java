package org.EternalReturn.EREntity;

import org.EternalReturn.EREntity.GlobalMonobehav.Stun;
import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.Util.DPEngine.Behaviour.MonobehaviourActor;
import org.EternalReturn.Util.DPEngine.Geometry.Collider;
import org.bukkit.entity.Entity;
import org.jetbrains.annotations.NotNull;

/**
 * 모든 EREntity의 Subclass에게 동시에 통용되는 성질을 저장하는 곳. <p>
 * */
public abstract class EREntity extends MonobehaviourActor {

    protected Entity entity;

    protected @NotNull Collider collider;

    protected EREntity(@NotNull Collider collider){
        PluginInstance.getEREngine().registerMonobehaviourActor(this);
        this.registerMonobehaviour(this, new Stun());
        this.collider = collider;
    }

    public @NotNull Collider getCollider() {
        return this.collider;
    }

    /**
     * 해당 MonobehaviourActor의 Collider 설정
     * */
    public void setCollider(@NotNull Collider collider){
        this.collider = collider;
    }

    public Entity getEntity(){
        return this.entity;
    }

}
