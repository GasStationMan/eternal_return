package org.EternalReturn.EREntity;

import org.EternalReturn.EREntity.GlobalMonobehav.Stun;
import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.Util.DPEngine.Behaviour.MonobehaviourActor;
import org.EternalReturn.Util.DPEngine.Geometry.Collider;
import org.bukkit.entity.Entity;
import org.jetbrains.annotations.NotNull;

/**
 * 모든 EREntity의 Subclass에게 동시에 통용되는 성질을 저장하는 곳. <p>
 * 생성자에 위험한 구문이 껴 있음. 그것만큼은 알아둘 것.
 * */
public abstract class EREntity extends MonobehaviourActor {

    protected Entity entity;

    protected @NotNull Collider collider;

    protected EREntity(@NotNull Collider collider){


        ///이거 존나 위험한 구문임. 나중에 어떻게든 수정해야 할 것.
        PluginInstance.getEREngine().registerMonobehaviourActor(this);
        ///이거 존나 위험한 구문임. 나중에 어떻게든 수정해야 할 것.


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
