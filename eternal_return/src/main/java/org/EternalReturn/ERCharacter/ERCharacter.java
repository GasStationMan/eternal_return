package org.EternalReturn.ERCharacter;

import org.EternalReturn.EREntity.EREntity;
import org.EternalReturn.ERPlayer.ERPlayer;

public abstract class ERCharacter extends EREntity {

    protected ERPlayer erPlayer;

    protected long cooldownSeconds;

    public ERCharacter(ERPlayer erPlayer){
        this.erPlayer = erPlayer;
    }

    public abstract String getName();

    public ERPlayer getERPlayer(){
        return this.erPlayer;
    }
}
