package org.EternalReturn.ERAnimal;

import org.EternalReturn.ERAnimal.GlobalMonobehav.Battle;
import org.EternalReturn.ERAnimal.GlobalMonobehav.Ready;
import org.EternalReturn.EREntity.EREntity;
import org.EternalReturn.Util.DPEngine.Geometry.Collider;
import org.jetbrains.annotations.NotNull;

/**
 * MonobehaviourActor역할을 하는 야생동물 클래스.
 * */
public class ERAnimal extends EREntity {

    protected ERAJEntity ajEntity;
    /**
     * 야생동물 스킬 쿨다운
     * */
    protected long cooldownSeconds;

    public ERAnimal(ERAJEntity ajEntity, @NotNull Collider collider){
        super(collider);
        //System.out.println(collider.getClass());
        this.ajEntity = ajEntity;
        registerMonobehaviour(this, new Ready());
        registerMonobehaviour(this, new Battle());
    }

    public ERAJEntity getAJEntity(){
        return this.ajEntity;
    }

    public boolean isShown(){
        return this.ajEntity.isShown;
    }

}
