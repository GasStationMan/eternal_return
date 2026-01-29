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
        super(erPlayer.getPlayer(), PluginInstance.getEREngine().createCylinder(
                PluginInstance.getEREngine().createInfStrightLine(0,1,0,
                        erPlayer.getPlayer().getLocation().getX(),
                        erPlayer.getPlayer().getLocation().getY(),
                        erPlayer.getPlayer().getLocation().getZ()),
                1,3));
        this.erPlayer = (ERPlayer)getEntity();
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
