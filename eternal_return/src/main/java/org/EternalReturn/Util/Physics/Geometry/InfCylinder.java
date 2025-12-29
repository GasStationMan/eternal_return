package org.EternalReturn.Util.Physics.Geometry;

public class InfCylinder  implements Collider{

    public InfStraightLine center;

    public double radius;

    public InfCylinder(InfStraightLine line, double radius){
        this.center = line;
        this.radius = radius;
    }

}
