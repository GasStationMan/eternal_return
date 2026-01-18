package org.EternalReturn.ERAnimal;

import org.EternalReturn.EREntity.EREntity;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.EternalReturn.Util.physics.Geometry.Collider;
import org.jetbrains.annotations.NotNull;

/**
 * MonobehaviourActor역할을 하는 야생동물 클래스.
 * */
public class ERAnimal extends EREntity {

    protected ERAJEntity ajEntity;

    protected @NotNull Collider collider;

    /**
     * 야생동물 스킬 쿨다운
     * */
    protected long cooldownSeconds;

    public ERAnimal(ERAJEntity ajEntity, @NotNull Collider collider){
        this.ajEntity = ajEntity;
        this.collider = collider;
    }

    public ERAJEntity getAJEntity(){
        return this.ajEntity;
    }

    public boolean isShown(){
        return this.ajEntity.isShown;
    }

}
