package org.EternalReturn.EREntity;

import org.EternalReturn.ERCharacter.GlobalMonobehav.RayCasting;
import org.EternalReturn.ERCharacter.GlobalMonobehav.Stun;
import org.EternalReturn.Util.Monobehaviour.MonobehaviourActor;

/**
 * 모든 EREntity의 Subclass에게 동시에 통용되는 성질을 저장하는 곳. <p>
 * */
public class EREntity extends MonobehaviourActor {

    protected EREntity(){
        this.registerMonobehaviour(this, new Stun());
        this.registerMonobehaviour(this, new RayCasting());
    }

}
