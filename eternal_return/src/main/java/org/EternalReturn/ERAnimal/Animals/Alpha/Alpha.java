package org.EternalReturn.ERAnimal.Animals.Alpha;

import org.EternalReturn.ERAnimal.ERAJEntity;
import org.EternalReturn.ERAnimal.ERAnimal;
import org.EternalReturn.ERAnimal.GlobalMonobehav.Battle;
import org.EternalReturn.ERAnimal.GlobalMonobehav.Ready;
import org.EternalReturn.Util.physics.Geometry.Cylinder;
import org.EternalReturn.Util.physics.Geometry.InfStraightLine;
import org.bukkit.Location;
import org.jetbrains.annotations.NotNull;

public class Alpha extends ERAnimal {

    public Alpha(@NotNull Location location) {
        super(
                new ERAJEntity("animal_alpha", location),
                new Cylinder(new InfStraightLine(0,1,0, location.getX(), location.getY(), location.getZ()),1,3)
        );

        this.ajEntity.registerAnimation("ready",2.0d);
        this.ajEntity.registerAnimation("attack",2.3d);
        this.ajEntity.registerAnimation("move",3.5d);
        this.ajEntity.registerAnimation("skill",3.25d);
        this.ajEntity.registerAnimation("death",2.0d);

        registerMonobehaviour(this, new Ready());
        registerMonobehaviour(this, new Battle());

    }

}