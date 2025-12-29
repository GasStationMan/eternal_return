package org.EternalReturn.Util.Physics.Geometry;

public class Cylinder extends InfCylinder {

    public double height;
    public InfPlane top;
    public InfPlane bottom;

    public Cylinder(InfStraightLine centerLine, double radius, double height){
        super(centerLine,radius);
        double x = centerLine.px, y = centerLine.py, z = centerLine.pz;
        this.height = height;
        this.top    = new InfPlane(0,1,0,x,y,z);
        this.bottom = new InfPlane(0,1,0,x,y + height,z);;
    }

}
