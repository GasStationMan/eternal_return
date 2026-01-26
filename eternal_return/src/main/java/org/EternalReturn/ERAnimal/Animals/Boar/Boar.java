package org.EternalReturn.ERAnimal.Animals.Boar;

import org.EternalReturn.ERAnimal.ERAJEntity;
import org.EternalReturn.ERAnimal.ERAnimal;
import org.EternalReturn.ERAnimal.GlobalMonobehav.Battle;
import org.EternalReturn.ERAnimal.GlobalMonobehav.Ready;
import org.EternalReturn.System.PluginInstance;
import org.EternalReturn.Util.DPEngine.Geometry.Cylinder;
import org.EternalReturn.Util.DPEngine.Geometry.InfStraightLine;
import org.bukkit.Location;
import org.jetbrains.annotations.NotNull;

public class Boar extends ERAnimal {

    public Boar(@NotNull Location location) {
        super(
                new ERAJEntity("animal_boar", location),
                PluginInstance.getEREngine().createCylinder(location,3,1)
        );

        this.ajEntity.registerAnimation("ready",2.0d);
        this.ajEntity.registerAnimation("attack",2.3d);
        this.ajEntity.registerAnimation("move",3.5d);
        this.ajEntity.registerAnimation("skill",3.25d);
        this.ajEntity.registerAnimation("death",2.0d);

    }

}