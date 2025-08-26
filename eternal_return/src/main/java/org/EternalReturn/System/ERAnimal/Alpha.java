package org.EternalReturn.System.ERAnimal;

import org.EternalReturn.Util.Physics.Geometry.Cylinder.Cylinder;
import org.EternalReturn.Util.Physics.MathVector.Vec3d;
import org.bukkit.Location;
import org.jetbrains.annotations.NotNull;

public class Alpha extends ERAnimal<Cylinder>{

    public Alpha(@NotNull Vec3d position) {
        super("animal_alpha",
                new Cylinder(
                        new Vec3d(0,1,0),
                        position,
                        3,
                        1.5
                ));
    }

    public Alpha(@NotNull Location position) {
        super("animal_alpha",
                new Cylinder(
                        new Vec3d(0,1,0),
                        new Vec3d(position.getX(), position.getY(), position.getZ()),
                        3,
                        1.5
                ));
    }

}
