package org.EternalReturn.EREntity;

import org.EternalReturn.EREntity.GlobalMonobehav.InfinityHealing;
import org.EternalReturn.System.PluginInstance;
import org.bukkit.entity.Entity;

public class ERDummy extends EREntity{

    public ERDummy(Entity entity){
        super(PluginInstance.getEREngine().createCylinder(
                PluginInstance.getEREngine().createInfStrightLine(0,1,0,
                        entity.getLocation().getX(),
                        entity.getLocation().getY(),
                        entity.getLocation().getZ()),
                1,3));
        registerMonobehaviour(this, new InfinityHealing());
        this.entity = entity;
    }

}
