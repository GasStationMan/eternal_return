package org.EternalReturn.EREntity;

import org.EternalReturn.EREntity.GlobalMonobehav.InfinityHealing;
import org.EternalReturn.System.PluginInstance;
import org.bukkit.entity.Entity;

public class ERDummy extends EREntity{

    public ERDummy(Entity entity){
        super(PluginInstance.getEREngine().createOrientedBox(entity.getLocation(),1.0/2,2.0/2,1.0/2));
        this.setEntity(entity);
        registerMonobehaviour(new InfinityHealing());
    }

}
