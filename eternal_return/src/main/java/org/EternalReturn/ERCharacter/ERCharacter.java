package org.EternalReturn.ERCharacter;

import org.EternalReturn.ERCharacter.GlobalMonobehav.PlayerRayCastingByLeftClicking;
import org.EternalReturn.EREntity.EREntity;
import org.EternalReturn.ERPlayer.ERPlayer;
import org.EternalReturn.System.PluginInstance;
import org.bukkit.entity.Player;

public abstract class ERCharacter extends EREntity {

    protected ERPlayer erPlayer;

    protected long cooldownSeconds;

    public ERCharacter(ERPlayer erPlayer){
        super(PluginInstance.getEREngine().createOrientedBox(erPlayer.getPlayer().getLocation(),1.0/2,3.0/2,1.0/2));
        this.setEntity(erPlayer.getPlayer());
        this.erPlayer = erPlayer;
        registerMonobehaviour(new PlayerRayCastingByLeftClicking());
    }

    public abstract String getName();

    public ERPlayer getERPlayer(){
        return this.erPlayer;
    }

    public Player getPlayer(){
        return (Player)this.getEntity();
    }
}
