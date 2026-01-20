package org.EternalReturn.ERAnimal.Animals.Bear;

import org.EternalReturn.ERAnimal.ERAJEntity;
import org.EternalReturn.ERAnimal.ERAnimal;
import org.EternalReturn.ERAnimal.GlobalMonobehav.Battle;
import org.EternalReturn.ERAnimal.GlobalMonobehav.Ready;
import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.Util.DPEngine.Geometry.Cylinder;
import org.EternalReturn.Util.DPEngine.Geometry.InfStraightLine;
import org.bukkit.Location;
import org.jetbrains.annotations.NotNull;

public class Bear extends ERAnimal{

    public Bear(@NotNull Location location) {
        super(
                new ERAJEntity("animal_bear", location),
                PluginInstance.getEREngine().cylinder(location,3,2)
        );

        this.ajEntity.registerAnimation("ready",2.0d);
        this.ajEntity.registerAnimation("attack",2.3d);
        this.ajEntity.registerAnimation("move",3.5d);
        this.ajEntity.registerAnimation("skill",3.25d);
        this.ajEntity.registerAnimation("death",2.0d);

    }

}
