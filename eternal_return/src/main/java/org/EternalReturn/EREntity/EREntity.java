package org.EternalReturn.EREntity;

import org.EternalReturn.ERCharacter.GlobalMonobehav.RayCasting;
import org.EternalReturn.ERCharacter.GlobalMonobehav.Stun;
import org.EternalReturn.Util.Monobehaviour.MonobehaviourActor;
import org.EternalReturn.Util.physics.Geometry.Collider;
import org.EternalReturn.Util.physics.Geometry.Cylinder;
import org.jetbrains.annotations.NotNull;

/**
 * 모든 EREntity의 Subclass에게 동시에 통용되는 성질을 저장하는 곳. <p>
 * */
public class EREntity extends MonobehaviourActor {

    protected Collider collider;

    protected EREntity(){
        this.registerMonobehaviour(this, new Stun());
        this.registerMonobehaviour(this, new RayCasting());
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
}
