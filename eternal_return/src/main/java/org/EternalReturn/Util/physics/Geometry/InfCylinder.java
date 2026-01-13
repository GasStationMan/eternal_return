package org.EternalReturn.Util.physics.Geometry;

public class InfCylinder  implements Collider{

    public InfStraightLine center;

    public double radius;

    public InfCylinder(InfStraightLine line, double radius){
        this.center = line;
        this.radius = radius;
    }

    @Override
    public void setPosition(double x, double y, double z) {
        center.px = x;
        center.py = y;
        center.pz = z;
    }
}
